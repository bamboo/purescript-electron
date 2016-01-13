"use strict";

// module Electron.BrowserWindow

exports.newBrowserWindowImpl = function(options) {
  var BrowserWindow = require('electron').BrowserWindow;
  return function() {
    return new BrowserWindow(options);
  };
}

exports.onCloseImpl = function(unsafePerformEff) {
  return function(browserWindow) {
    return function(callback) {
      return function() {
        return browserWindow.on('close', function() {
          unsafePerformEff(callback);
        });
      };
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
