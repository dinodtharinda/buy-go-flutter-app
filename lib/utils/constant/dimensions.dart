// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Dime {



  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;

  static const double RADIUS_SMALL = 5.0;
  static const double RADIUS_DEFAULT = 10.0;
  static const double RADIUS_LARGE = 15.0;
  static const double RADIUS_EXTRA_LARGE = 20.0;

  static double SCREEN_WIDTH(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double R_ICON_SIZE(BuildContext context) {
    return MediaQuery.sizeOf(context).width * 0.05;
  }

  static double R_FONT_SIZE_DEFAULT(BuildContext context){
    return MediaQuery.sizeOf(context).width *0.036;
  }
   static double R_FONT_SIZE_SMALL(BuildContext context){
    return MediaQuery.sizeOf(context).width *0.025;
  }
   static double R_FONT_SIZE_LARGE(BuildContext context){
    return MediaQuery.sizeOf(context).width *0.044;
  }
 
    static double R_FONT_SIZE_EXTRA_LARGE(BuildContext context){
    return MediaQuery.sizeOf(context).width *0.07;
  }

  static const FontWeight FONT_WEIGHT_EXTASMALL = FontWeight.w200;
  static const FontWeight FONT_WEIGHT_SMALL = FontWeight.w300;

  static const FontWeight FONT_WEIGHT_DEFAULT = FontWeight.w400;
  static const FontWeight FONT_WEIGHT_MEDIUM= FontWeight.w500;

  static const FontWeight FONT_WEIGHT_LARGE = FontWeight.w700;
   static const FontWeight FONT_WEIGHT_EXTRA_LARGE = FontWeight.w900;
}
