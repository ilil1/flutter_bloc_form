import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config.dart';

final lightTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.light,
    KRTextTheme.light,
  ],
  brightness: Brightness.light,
  scaffoldBackgroundColor: lightBackground,
  dividerColor: gray1,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: white),
  appBarTheme: AppBarTheme(
    backgroundColor: lightBackground,
    foregroundColor: black3,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: const IconThemeData(color: black3),
    titleTextStyle: KRTextTheme.dark.krBody3.copyWith(color: black3),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white.withOpacity(0),
    elevation: 0,
    selectedItemColor: const Color(0xff1F2A66),
    unselectedItemColor: const Color(0xff999C99),
    selectedLabelStyle: const TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xff1F2A66)),
    unselectedLabelStyle: const TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w500),
  ),
);

final darkTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    ColorTheme.dark,
    KRTextTheme.dark,
  ],
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  dividerColor: black,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackground,
    foregroundColor: white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(color: white),
    titleTextStyle: KRTextTheme.dark.krBody3.copyWith(color: white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: black.withOpacity(0),
    elevation: 0,
    selectedItemColor: white,
    unselectedItemColor: gray1,
    selectedLabelStyle: const TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w800, color: white),
    unselectedLabelStyle: const TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w500, color: gray1),
  ),
);
