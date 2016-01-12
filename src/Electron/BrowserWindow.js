"use strict";

// module Electron.BrowserWindow

const BrowserWindow = require('electron').BrowserWindow;

// TODO: handle nested records (e.g. webPreferences)
function browserWindowOptionsFrom(options) {
  var rec = {}
  var len = options.length
  for(var idx = 0; idx < len; idx++) {
    var k = camelCaseConstructorNameFor(options[idx])
    var v = options[idx].value0
    rec[k] = v
  }
  return rec;
}

exports.newBrowserWindow = function(options) {
  return function() {
    return new BrowserWindow(browserWindowOptionsFrom(options));
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

// TODO: code duplication
function camelCaseConstructorNameFor(value) {
  const ctorName = value.constructor.name;
  return ctorName[0].toLowerCase() + ctorName.substring(1);
}
