import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white, appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(color: AppColor.appBarColor);
}