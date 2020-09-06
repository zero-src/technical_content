    //--------------------------------------------------------------------------------------------------------------------\\
                                                       VARIABLE TYPES
    //--------------------------------------------------------------------------------------------------------------------\\
    
    #define con_1 [ 0 til 65 535 ]
    #define con_2 [ 0 til 4 294 967 295 ]
    #define con_3 [ −2 147 483 648 til 2 147 483 647 ]
    #define con_4 [ −9 223 372 036 854 775 808 til +9 223 372 036 854 775 807 ]
    #define con_5 [ 0 til 18 446 744 073 709 551 615 ]
    
    | Type    |         Byte          |                Variable range                 |
    -----------------------------------------------------------------------------------
    |  bool   |         1          |   true or false                                  |
    |  char   |         1          |   [ -128 til 127 ] or [ 0 til 255 ]              | // 1st range relates to signed char | 2nd range relates to unsigned char 
    | wchar_t | win: 1 | linux: 4  |   byte == 1 ? con_1 : con_2                      |
    |  short  |         2          |   [" –32768 til 32767 "]                         | // unsigned short [ 0 til 65535 ]
    |   int   |       2 or 4       |   if bytes == 2 ? [" –32768 til 32767 "] : con_3 | // signed int, signed int or unsigned int
    |  long   |         4          |   [" −2 147 483 648 til 2 147 483 647 "]         | // unsigned long [ con_2 ] | long long [ con_4 ] | unsigned long [ con_5 ]
    |  float  |         4          |    +/- 3.4E-38 до 3.4E+38                        |
    | double  |         8          |    +/- 1.7E-308 до 1.7E+308                      |
    |_________________________________________________________________________________|
