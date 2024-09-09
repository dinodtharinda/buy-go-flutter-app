import 'package:flutter/material.dart';

class CustomColor{
 static const Color primaryColor = Color(0xFF0890F1); 
 static const Color secondaryColor = Color(0xFFFFD06D);
 static const Color backColor = Colors.black;
 static const Color lightColor = Colors.white;

 static const Color greyColor = Color(0xFFb0b0b0);
 static  Color deepGreyColor = darkenColor(greyColor,0.4);


 static  Color darkColor = darkenColor(primaryColor, 0.7);
 static  Color secondDarkColor = darkenColor(primaryColor, 0.5);


  static Color darkenColor(Color color, [double factor = 0.2]) {
    int red = (color.red * (1.0 - factor)).round();
    int green = (color.green * (1.0 - factor)).round();
    int blue = (color.blue * (1.0 - factor)).round();

    return Color.fromRGBO(red, green, blue, 1);
  }
}