"use strict";

// module Electron.Event

exports.preventDefault = function(e) {
  return function() {
    e.preventDefault();
  };
};

exports.stopPropagation = function(e) {
  return function() {
    e.stopPropagation();
  };
};
