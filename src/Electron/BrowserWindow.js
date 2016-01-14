"use strict";

// module Electron.BrowserWindow

exports.newBrowserWindowImpl = function(options) {
  // require('electron') on demand so test suites can still run under node
  var BrowserWindow = require('electron').BrowserWindow;
  return function() {
    return new BrowserWindow(options);
  };
}

exports.onClose = function(browserWindow) {
  return function(callback) {
    return function() {
      return browserWindow.on('close', function() {
        callback();
      });
    };
  };
}

exports.loadURL = function(browserWindow) {
  return function(url) {
    return function() {
      return browserWindow.loadURL(url);
    };
  };
}
