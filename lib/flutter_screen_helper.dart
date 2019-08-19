import "dart:ui";

import 'package:flutter/material.dart';

class ScreenHelper {
  static double _designedWidth;
  static double _designedWitdhScaleFactor;
  static double _designedHeight;
  static double _designedHeightScaleFactor;

  static double _textScaleFactor;

  static setupDesignedSize(width, height) {
    _designedWidth = width.toDouble();
    _designedHeight = height.toDouble();
    _refreshScaleFactor();
  }

  static _refreshScaleFactor() {
    print("window:${window.physicalSize}");
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
    print("mediaQuery:${mediaQuery.size}");
    _designedHeightScaleFactor = (window.physicalSize.width / window.devicePixelRatio) / _designedHeight;
    _designedWitdhScaleFactor = (window.physicalSize.height / window.devicePixelRatio) / _designedWidth;
    _textScaleFactor = window.textScaleFactor;
  }

static _refreshSizeIfNeeds() {
  if (_designedHeightScaleFactor == 0 || _designedWitdhScaleFactor == 0) {
    _refreshScaleFactor();
  }
}

}

 double kSizesFitToWidth(double size) {
   ScreenHelper._refreshSizeIfNeeds();
    return (size.toDouble() * ScreenHelper._designedWitdhScaleFactor).toDouble();
  }
 double kWidthSize(double width) {
   ScreenHelper._refreshSizeIfNeeds();
    return (width.toDouble() * ScreenHelper._designedWitdhScaleFactor).toDouble();
  }
 double kHeightSize(double height) {
   ScreenHelper._refreshSizeIfNeeds();
    return (height.toDouble() * ScreenHelper._designedHeightScaleFactor).toDouble();
  }
 double kFontSize(double size) {
   ScreenHelper._refreshSizeIfNeeds();
    return (size.toDouble() * ScreenHelper._textScaleFactor).toDouble();
  }
 double kAdjustsFontSize(double size) {
   ScreenHelper._refreshSizeIfNeeds();
    return (kFontSize(size) * ScreenHelper._textScaleFactor).toDouble();
  }