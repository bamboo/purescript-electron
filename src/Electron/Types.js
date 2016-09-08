"use strict";

exports.mkListener = function (fn) {
  return function (e,m) {
      fn(e)(m)();
  };
};
