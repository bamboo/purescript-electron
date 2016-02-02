"use strict";

// module Electron.Shell

const shell = require('electron').shell;

exports.showItemInFolder = function (fullPath) {
  return function () {
    return shell.showItemInFolder(fullPath);
  };
};

exports.openItem = function (fullPath) {
  return function () {
    return shell.openItem(fullPath);
  };
};

exports.openExternal = function (url) {
  return function () {
    return shell.openExternal(url);
  };
};

exports.moveItemToTrash = function (fullPath) {
  return function () {
    return shell.moveItemToTrash(fullPath);
  };
};

exports.beep = function () {
  return shell.beep();
};
