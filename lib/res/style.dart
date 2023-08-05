import 'package:flutter/material.dart';
import 'package:smart_home/res/color.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: WithColor.scaffoldColor,
  textTheme: const TextTheme(),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: WithColor.scaffoldColor,
  textTheme: const TextTheme(),
);

class Styles {
  Styles._();
  static TextStyle boldTemp = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black);

  static TextStyle boldTitle = const TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle normalTitle = const TextStyle(
      fontSize: 28, fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle normalLeftTime = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.blue);

  static TextStyle boldTempUnit = const TextStyle(
      fontSize: 19, fontWeight: FontWeight.bold, color: Colors.grey);
  static TextStyle boldDeviceName = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle normalStatus = const TextStyle(
      fontSize: 19, fontWeight: FontWeight.normal, color: Colors.grey);
}
