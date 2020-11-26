const { app, BrowserWindow } = require('electron');

app.on('ready', () => {
	let MainWindow = new BrowserWindow({
		width: 1280,
	});
	MainWindow.loadURL(`https://vk.com/im`)
	MainWindow.setMenuBarVisibility(false);

	MainWindow.on('close', () => {
		app.quit();
	});
});