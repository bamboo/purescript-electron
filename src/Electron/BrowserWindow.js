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

exports.webContents = function(browserWindow) {
  return function() {
    return browserWindow.webContents;
  };
}

exports.openDevToolsImpl = function(webContents) {
  return function(options) {
    return function() {
      webContents.openDevTools(options);
      return {};
    };
  };
}

exports.send = function(webContents) {
  return function(channel) {
    return function(arg) {
      return function() {
        webContents.send(channel, arg);
        return {};
      }
    }
  }
}

exports.onDidFinishLoad = function(webContent) {
  return function(callback) {
    return function() {
      return webContent.on('did-finish-load', function() {
        callback();
      });
    };
  };
}
