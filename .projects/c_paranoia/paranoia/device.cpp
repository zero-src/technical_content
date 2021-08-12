#include <stdlib.h>
#include <stdio.h>
#include <tchar.h>
#include <locale.h>

#include <windows.h>
#include <Setupapi.h>
#include <winusb.h>
#undef LowSpeed
#include <Usbioctl.h>
#include <Devpkey.h>

#pragma comment(lib,"Setupapi.lib")

#include "menu.h"
void ErrorMes(LPCTSTR lpszFunction)
{
    // Retrieve the system error message for the last-error code

    LPVOID lpMsgBuf;
    LPVOID lpDisplayBuf;
    DWORD dw = GetLastError();

    FormatMessage(
        FORMAT_MESSAGE_ALLOCATE_BUFFER |
        FORMAT_MESSAGE_FROM_SYSTEM |
        FORMAT_MESSAGE_IGNORE_INSERTS,
        NULL,
        dw,
        MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
        (LPTSTR)&lpMsgBuf,
        0, NULL);

    // Display the error message 

    lpDisplayBuf = (LPVOID)LocalAlloc(LMEM_ZEROINIT,
        (lstrlen((LPCTSTR)lpMsgBuf) + lstrlen(lpszFunction) + 40) * sizeof(TCHAR));
    wprintf(L"%s failed with error %d: %s",
        lpszFunction, dw, lpMsgBuf);

    LocalFree(lpMsgBuf);
    LocalFree(lpDisplayBuf);
}

//Поиск номера диска для USB-устройства
BOOL FindDiskNumber(LPCWSTR match, STORAGE_DEVICE_NUMBER* lpret) {

    BOOL retval = FALSE;
    DEVPROPTYPE dpt = 0;
    wchar_t buffer[1024] = L"";
    TCHAR id_upper[1024] = L"";
    DWORD RequiredSize = 0;
    SP_DEVINFO_DATA devinfo = { 0 };
    SP_DEVICE_INTERFACE_DATA deviceInterface = { 0 };
    PSP_DEVICE_INTERFACE_DETAIL_DATA deviceInterfaceDetail = NULL;
    BOOL res;

    HDEVINFO deviceInfoHandle = SetupDiGetClassDevs(&GUID_DEVINTERFACE_DISK, 0, 0, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);

    if (deviceInfoHandle != INVALID_HANDLE_VALUE)
    {
        int deviceIndex = 0;
        while (true)
        {
            ZeroMemory(&deviceInterface, sizeof(deviceInterface));
            deviceInterface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

            //получение всех дисков
            if (SetupDiEnumDeviceInterfaces(deviceInfoHandle, 0, &GUID_DEVINTERFACE_DISK, deviceIndex, &deviceInterface))
            {
                DWORD cbRequired = 0;

                SetupDiGetDeviceInterfaceDetail(deviceInfoHandle, &deviceInterface, 0, 0, &cbRequired, 0);
                if (ERROR_INSUFFICIENT_BUFFER == GetLastError())
                {
                    deviceInterfaceDetail = (PSP_DEVICE_INTERFACE_DETAIL_DATA)(new char[cbRequired]);
                    memset(deviceInterfaceDetail, 0, cbRequired);
                    deviceInterfaceDetail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

                    if (!SetupDiGetDeviceInterfaceDetail(deviceInfoHandle, &deviceInterface,
                        deviceInterfaceDetail, cbRequired, &cbRequired, 0))
                    {
                        goto Next;
                    }

                    // Initialize the structure before using it.
                    memset(deviceInterfaceDetail, 0, cbRequired);
                    deviceInterfaceDetail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

                    // Call the API a second time to retrieve the actual
                    // device path string.
                    BOOL status = SetupDiGetDeviceInterfaceDetail(
                        deviceInfoHandle,  // Handle to device information set
                        &deviceInterface,     // Pointer to current node in devinfo set
                        deviceInterfaceDetail,   // Pointer to buffer to receive device path
                        cbRequired,   // Length of user-allocated buffer
                        &cbRequired,  // Pointer to arg to receive required buffer length
                        NULL);        // Not interested in additional data


                    //получение информации об устройстве 
                    ZeroMemory(&devinfo, sizeof(devinfo));
                    devinfo.cbSize = sizeof(SP_DEVINFO_DATA);
                    BOOL success = SetupDiEnumDeviceInfo(deviceInfoHandle, deviceIndex, &devinfo);
                    if (success == FALSE) { ErrorMes(L"SetupDiEnumDeviceInfo"); goto Next; }

                    res = SetupDiGetDeviceProperty(deviceInfoHandle, &devinfo,
                        &DEVPKEY_Device_Parent, &dpt, (PBYTE)buffer, 1000, NULL, 0);
                    if (res == FALSE) { ErrorMes(L"SetupDiGetDeviceProperty"); goto Next; }

                    int len = wcslen(buffer);
                    for (int i = 0; i < len; i++) {
                        id_upper[i] = toupper(buffer[i]);//преобразование в заглавные буквы
                    }

                    if (wcsstr(id_upper, match) != NULL) { //если ID родительского устройства содержит нужную строку

                        /*Открываем устройство для отправки IOCTL*/
                        HANDLE handle = CreateFile(deviceInterfaceDetail->DevicePath, 0,
                            FILE_SHARE_READ | FILE_SHARE_WRITE,
                            0, OPEN_EXISTING, 0, 0);

                        if (handle == INVALID_HANDLE_VALUE) {
                            ErrorMes(L"CreateFile"); goto Next;
                        }

                        STORAGE_DEVICE_NUMBER sdn = { 0 };
                        DWORD nbytes = 0;

                        //получение номера диска
                        res = DeviceIoControl(handle,                // handle to device
                            IOCTL_STORAGE_GET_DEVICE_NUMBER, // dwIoControlCode
                            NULL,                            // lpInBuffer
                            0,                               // nInBufferSize
                            (LPVOID)&sdn,           // output buffer
                            (DWORD)sizeof(sdn),         // size of output buffer
                            (LPDWORD)&nbytes,       // number of bytes returned
                            NULL      // OVERLAPPED structure
                        );
                        CloseHandle(handle);

                        if (res != FALSE) {
                            //устройство найдено
                            memcpy(lpret, &sdn, sizeof(sdn));
                            retval = TRUE;
                        }
                        else ErrorMes(L"DeviceIoControl");

                    }
                }
            }
            else
            {
                break;
            }

        Next:
            if (deviceInterfaceDetail != NULL) {
                delete[] deviceInterfaceDetail;
                deviceInterfaceDetail = NULL;
            }

            if (retval != FALSE) break; //устройство уже найдено

            deviceIndex++; //следующее устройство
        }

        SetupDiDestroyDeviceInfoList(deviceInfoHandle);
    }
    else ErrorMes(L"SetupDiGetClassDevs");

    return retval;
}

//таблица номеров для всех дисков
bool disk_IsUsed[30] = { 0 };
STORAGE_DEVICE_NUMBER disk_number[30] = { 0 };

void menu::connected_devices()
{
    setlocale(LC_ALL, "Russian");

    HANDLE hVol;
    DWORD nbytes;
    WCHAR letter;
    WCHAR volume[100] = { 0 };
    int i;
    STORAGE_DEVICE_NUMBER sdn = { 0 };

    //заполняем таблицу номеров для дисков
    for (i = 0; i < 30; i++) {
        letter = 'A' + i;
        wsprintf(volume, L"\\\\.\\%c:", letter);

        disk_IsUsed[i] = FALSE;
        hVol = CreateFile(volume, 0,
            FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
            OPEN_EXISTING, 0, NULL);
        if (hVol == NULL || hVol == INVALID_HANDLE_VALUE) { continue; }

        BOOL ret = DeviceIoControl(hVol,                // handle to device
            IOCTL_STORAGE_GET_DEVICE_NUMBER, // dwIoControlCode
            NULL,                            // lpInBuffer
            0,                               // nInBufferSize
            (LPVOID) & (disk_number[i]),           // output buffer
            (DWORD)sizeof(STORAGE_DEVICE_NUMBER),         // size of output buffer
            (LPDWORD)&nbytes,       // number of bytes returned
            NULL      // OVERLAPPED structure
        );
        CloseHandle(hVol);

        if (ret == FALSE) { continue; }

        disk_IsUsed[i] = TRUE;
    }

    WCHAR match[1024] = { 0 };

    GUID guid = { 0xF18A0E88, 0xC30C, 0x11D0, { 0x88, 0x15, 0x00, 0xA0, 0xC9, 0x06, 0xBE, 0xD8 } };
    /*USB HUB Interface class GUID*/

    HDEVINFO deviceInfoHandle = SetupDiGetClassDevs(&guid, 0, 0, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);

    if (deviceInfoHandle != INVALID_HANDLE_VALUE)
    {
        int deviceIndex = 0;
        while (true)
        {
            SP_DEVICE_INTERFACE_DATA deviceInterface = { 0 };
            deviceInterface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

            //получение всех USB-концентраторов
            if (SetupDiEnumDeviceInterfaces(deviceInfoHandle, 0, &guid, deviceIndex, &deviceInterface))
            {
                DWORD cbRequired = 0;

                SetupDiGetDeviceInterfaceDetail(deviceInfoHandle, &deviceInterface, 0, 0, &cbRequired, 0);
                if (ERROR_INSUFFICIENT_BUFFER == GetLastError())
                {
                    PSP_DEVICE_INTERFACE_DETAIL_DATA deviceInterfaceDetail =
                        (PSP_DEVICE_INTERFACE_DETAIL_DATA)(new char[cbRequired]);
                    memset(deviceInterfaceDetail, 0, cbRequired);
                    deviceInterfaceDetail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

                    if (!SetupDiGetDeviceInterfaceDetail(deviceInfoHandle, &deviceInterface,
                        deviceInterfaceDetail, cbRequired, &cbRequired, 0))
                    {
                        delete[] deviceInterfaceDetail;
                        deviceIndex++;
                        continue;
                    }

                    // Initialize the structure before using it.
                    memset(deviceInterfaceDetail, 0, cbRequired);
                    deviceInterfaceDetail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

                    // Call the API a second time to retrieve the actual
                    // device path string.
                    BOOL status = SetupDiGetDeviceInterfaceDetail(
                        deviceInfoHandle,  // Handle to device information set
                        &deviceInterface,     // Pointer to current node in devinfo set
                        deviceInterfaceDetail,   // Pointer to buffer to receive device path
                        cbRequired,   // Length of user-allocated buffer
                        &cbRequired,  // Pointer to arg to receive required buffer length
                        NULL);        // Not interested in additional data

                    BOOL res;

                    /*Открываем устройство для отправки IOCTL*/
                    HANDLE handle = CreateFile(deviceInterfaceDetail->DevicePath, GENERIC_WRITE, FILE_SHARE_WRITE,
                        0, OPEN_EXISTING, 0, 0);

                    if (handle != INVALID_HANDLE_VALUE) {

                        DWORD bytes_read = 0;
                        UINT ports = 0;
                        USB_NODE_INFORMATION nodeinfo;
                        USB_NODE_CONNECTION_INFORMATION_EX coninfo = { 0 };
                        const UINT BUFSIZE = 1000;
                        char buffer[BUFSIZE] = { 0 };
                        USB_DESCRIPTOR_REQUEST* req = (USB_DESCRIPTOR_REQUEST*)&buffer;
                        USB_STRING_DESCRIPTOR* desc;

                        ZeroMemory(&nodeinfo, sizeof(nodeinfo));
                        nodeinfo.NodeType = UsbHub;

                        //получаем число портов на концентраторе                         
                        res = DeviceIoControl(handle, IOCTL_USB_GET_NODE_INFORMATION,
                            &nodeinfo, sizeof(nodeinfo), &nodeinfo, sizeof(nodeinfo), &bytes_read, 0);

                        if (res == FALSE)ErrorMes(L"DeviceIoControl");
                        else ports = (UINT)nodeinfo.u.HubInformation.HubDescriptor.bNumberOfPorts;

                        for (int j = 1; j <= ports; j++) {
                            ZeroMemory(&coninfo, sizeof(coninfo));
                            coninfo.ConnectionIndex = j;

                            //получаем инфу о порте
                            res = DeviceIoControl(handle, IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX,
                                &coninfo, sizeof(coninfo), &coninfo, sizeof(coninfo), &bytes_read, 0);
                            if (res == FALSE) { ErrorMes(L"DeviceIoControl"); continue; }

                            if (coninfo.ConnectionStatus == 0) continue; //нет устройства

                            printf("\n- Hub %2d, Port %2d: USB v%x device\n", deviceIndex,
                                j, (int)coninfo.DeviceDescriptor.bcdUSB);
                            printf("VID: %04X PID: %04X\n", (int)coninfo.DeviceDescriptor.idVendor
                                , (int)coninfo.DeviceDescriptor.idProduct);

                            //формируем строку для поиска устройства
                            wsprintf(match, L"VID_%04X&PID_%04X", (UINT)coninfo.DeviceDescriptor.idVendor
                                , (UINT)coninfo.DeviceDescriptor.idProduct);

                            /*Serial number*/
                            ZeroMemory(buffer, BUFSIZE);
                            req->ConnectionIndex = j;
                            req->SetupPacket.wValue = (USB_STRING_DESCRIPTOR_TYPE << 8) + coninfo.DeviceDescriptor.iSerialNumber;
                            req->SetupPacket.wLength = BUFSIZE - sizeof(USB_DESCRIPTOR_REQUEST);
                            req->SetupPacket.wIndex = 0x409; //US English
                            res = DeviceIoControl(handle, IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION,
                                &buffer, sizeof(buffer), &buffer, sizeof(buffer), &bytes_read, 0);
                            if (res == FALSE) { ErrorMes(L"DeviceIoControl"); continue; }
                            desc = (USB_STRING_DESCRIPTOR*)(&req->Data[0]);
                            wprintf(L"Serial: %s\n", desc->bString);

                            /*Vendor*/
                            ZeroMemory(buffer, BUFSIZE);
                            req->ConnectionIndex = j;
                            req->SetupPacket.wValue = (USB_STRING_DESCRIPTOR_TYPE << 8) + coninfo.DeviceDescriptor.iManufacturer;
                            req->SetupPacket.wLength = BUFSIZE - sizeof(USB_DESCRIPTOR_REQUEST);
                            req->SetupPacket.wIndex = 0x409; //US English
                            res = DeviceIoControl(handle, IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION,
                                &buffer, sizeof(buffer), &buffer, sizeof(buffer), &bytes_read, 0);
                            if (res == FALSE) { ErrorMes(L"DeviceIoControl"); continue; }
                            desc = (USB_STRING_DESCRIPTOR*)(&req->Data[0]);
                            wprintf(L"Vendor: %s\n", desc->bString);

                            /*Product*/
                            ZeroMemory(buffer, BUFSIZE);
                            req->ConnectionIndex = j;
                            req->SetupPacket.wValue = (USB_STRING_DESCRIPTOR_TYPE << 8) + coninfo.DeviceDescriptor.iProduct;
                            req->SetupPacket.wLength = BUFSIZE - sizeof(USB_DESCRIPTOR_REQUEST);
                            req->SetupPacket.wIndex = 0x409; //US English
                            res = DeviceIoControl(handle, IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION,
                                &buffer, sizeof(buffer), &buffer, sizeof(buffer), &bytes_read, 0);
                            if (res == FALSE) { ErrorMes(L"DeviceIoControl"); continue; }
                            desc = (USB_STRING_DESCRIPTOR*)(&req->Data[0]);
                            wprintf(L"Product: %s\n", desc->bString);

                            /*Disk letter*/
                            res = FindDiskNumber(match, &sdn);
                            if (res != FALSE) {
                                for (i = 0; i < 30; i++)
                                    if (disk_IsUsed[i] != FALSE
                                        && disk_number[i].DeviceNumber == sdn.DeviceNumber
                                        && disk_number[i].DeviceType == sdn.DeviceType)
                                    {
                                        letter = 'A' + i;
                                        printf("Disk letter: %c\n", letter);
                                    }
                            }
                            else printf("Disk letter not found\n");

                        }

                        CloseHandle(handle);
                    }
                    else {
                        ErrorMes(L"CreateFile");//failed to open device
                    }//endif


                    delete[] deviceInterfaceDetail;
                }
            }
            else
            {
                break;
            }

            ++deviceIndex;
        }


        SetupDiDestroyDeviceInfoList(deviceInfoHandle);
    }
    else ErrorMes(L"SetupDiGetClassDevs");

    char c;
    while ((c = _getch()) != '\r') {
        if (c == '0') { system("cls"); system("mode con cols=81 lines=20"); draw(); }
        if (c == '1') { system("cls"); connected_devices(); }
    }
}