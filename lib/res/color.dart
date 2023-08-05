import 'dart:ui';

import 'package:flutter/material.dart';

abstract class WithColor {
  WithColor._();
  static const scaffoldColor = Color.fromARGB(255, 249, 249, 249);
  static const shadowCircleColor = Color.fromARGB(100, 105, 43, 11);
}

abstract class WithGradiant {
  WithGradiant._();
  static final conditionCardGradiant = [Colors.blue.shade200, Colors.blue];
}
