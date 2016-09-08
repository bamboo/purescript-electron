"use strict";

const EventEmitter = require('electron').EventEmitter;
const ipcRenderer  = require('electron').ipcRenderer;

exports.on = function(channel) {
  return function(listener) {
    return function() {
      return ipcRenderer.on(channel, listener);
    };
  };
};

exports.once = function(channel) {
  return function(listener) {
    return function() {
      return ipcRenderer.once(channel, listener);
    };
  };
};

exports.removeListener = function(channel) {
  return function(listener) {
    return function() {
      return ipcRenderer.removeListener(channel, listener);
    };
  };
};

exports.removeAllListeners = function(channel) {
  return function() {
    return ipcRenderer.removeAllListeners(channel);
  };
};

exports.removeAllChannelListeners = function() {
  return function() {
    return ipcRenderer.removeAllListeners();
  };
};

exports.send = function(channel) {
  return function(arg) {
    return function() {
      return ipcRenderer.send(channel,arg);
    };
  };
};

exports.sendSync = function (channel) {
  return function(arg) {
    return function() {
      return ipcRenderer.sendSync(channel,arg);
    };
  };
};

exports.sendToHost = function(channel) {
  return function(arg) {
    return function() {
      return ipcRenderer.sendToHost(channel,arg);
    };
  };
};
