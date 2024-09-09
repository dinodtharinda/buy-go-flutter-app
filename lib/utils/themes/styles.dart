import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colors.dart';

import '../constant/dimensions.dart';

TextStyle textStyleDefault(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_DEFAULT,
    fontSize: Dime.R_FONT_SIZE_DEFAULT(context),
  
  );
}

TextStyle textStyleSmall(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_DEFAULT,
    fontSize: Dime.R_FONT_SIZE_SMALL(context),
    
  );
}


TextStyle textStyleSmallBold(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_LARGE,
    fontSize: Dime.R_FONT_SIZE_SMALL(context),
    
  );
}

TextStyle textStyleLarge(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_DEFAULT,
    fontSize: Dime.R_FONT_SIZE_LARGE(context),
    
  );
}

TextStyle textStyleLargeBold(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_LARGE,
    fontSize: Dime.R_FONT_SIZE_LARGE(context),
    
  );
}

TextStyle textStyleExtraLarge(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dime.FONT_WEIGHT_EXTRA_LARGE,
    fontSize: Dime.R_FONT_SIZE_EXTRA_LARGE(context),
  
  );
}

const customBoxShadow = BoxShadow(
  color: CustomColor.greyColor,
  spreadRadius: 1,
  blurRadius: 5,
  offset: Offset(0, 3), // changes position of shadow
);


 NumberFormat formatCurrency = NumberFormat.currency(locale: 'en_US', symbol: 'LKR');
  String formatPrice(double price) {
    return formatCurrency.format(price);
  }

Border customBorder = Border.all(width: 0.5, color: CustomColor.greyColor);
