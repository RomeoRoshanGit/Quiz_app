import 'package:flutter/material.dart';

TextStyle textBlack({Color? color, double? size}){
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: 'PoppinsBlack',
  );
}

TextStyle textMedium({Color? color, double? size}) {
  return TextStyle(
    fontSize:size,
    fontFamily: 'PoppinsMedium',
    color: color,
  );
}

TextStyle textRegular({Color? color, double? size}) {
  return TextStyle(
    fontSize:size,
    fontFamily: 'PoppinsRegular',
    color: color,
  );
}
TextStyle textSemiBold({Color? color, double? size}) {
  return TextStyle(
    fontSize:size,
    fontFamily: 'PoppinsSemiBold',
    color: color,
  );
}