import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightThemeData = ThemeData(
  primaryColorLight: AppColors.primary,
  primarySwatch: Colors.green,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  fontFamily: getFontFamily,
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColors.text,
    labelColor: AppColors.primary,
    labelStyle: TextStyle(
      fontFamily: getFontFamily,
      fontSize: 16,
      color: AppColors.text,
    ),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: AppColors.background,
        width: 2.5,
      ),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    margin: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 12,
    ),
    clipBehavior: Clip.antiAlias,
  ),
  // backgroundColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: AppColors.background,
      fontFamily: getFontFamily,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.text,
    shadowColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: getFontFamily,
      backgroundColor: AppColors.background,
      fontSize: 31,
      color: AppColors.text,
    ),
    iconTheme: IconThemeData(color: AppColors.text),
  ),
  buttonTheme: ButtonThemeData(highlightColor: AppColors.primary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Colors.transparent,
          // color: themeData.themeColor(context),
        ),
      ),
      backgroundColor: AppColors.primary,
      textStyle:
          TextStyle(color: AppColors.background, fontFamily: getFontFamily),
      minimumSize: const Size.fromHeight(35), // NEW
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 21, color: AppColors.text),
    displayMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 21, color: AppColors.text),
    displaySmall: TextStyle(fontFamily: getFontFamily, color: AppColors.text),
    headlineMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 18, color: AppColors.text),
    headlineSmall: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppColors.text),
    bodyLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppColors.text),
    bodyMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 14, color: AppColors.text),
    titleSmall: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppColors.text),
    titleMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 18, color: AppColors.text),
    titleLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppColors.text),
  ),
  scaffoldBackgroundColor: AppColors.background,
  brightness: Brightness.light,
  indicatorColor: AppColors.primary,
  primaryColor: AppColors.primary,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.3),
    foregroundColor: AppColors.primary,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: Color.fromRGBO(183, 183, 183, 1),
    collapsedBackgroundColor: Color.fromRGBO(183, 183, 183, 1),
  ),
);
final ThemeData darkThemeData = ThemeData(
  primaryColorLight: AppDarkColors.primary,
  primarySwatch: Colors.green,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppDarkColors.primary,
  ),
  fontFamily: getFontFamily,
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppDarkColors.background,
    labelColor: AppDarkColors.background,
    labelStyle: TextStyle(
      fontFamily: getFontFamily,
      fontSize: 16,
      color: AppDarkColors.text,
    ),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: AppDarkColors.background,
        width: 2.5,
      ),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    margin: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 12,
    ),
    clipBehavior: Clip.antiAlias,
  ),
  // backgroundColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: AppDarkColors.text,
      fontFamily: getFontFamily,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppDarkColors.background,
    shadowColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: getFontFamily,
      backgroundColor: Colors.transparent,
      fontSize: 31,
      color: AppDarkColors.text,
    ),
    iconTheme: IconThemeData(color: AppDarkColors.text),
  ),
  buttonTheme: const ButtonThemeData(highlightColor: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Colors.transparent,
          // color: themeData.themeColor(context),
        ),
      ),
      backgroundColor: AppDarkColors.accent,
      textStyle: TextStyle(color: Colors.white, fontFamily: getFontFamily),
      minimumSize: const Size.fromHeight(35), // NEW
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  dividerColor: AppDarkColors.accent.withOpacity(0.3),
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 21, color: AppDarkColors.text),
    displayMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 21, color: AppDarkColors.text),
    displaySmall: TextStyle(fontFamily: getFontFamily, color: AppDarkColors.text),
    headlineMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 18, color: AppDarkColors.text),
    headlineSmall: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppDarkColors.text),
    bodyLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppDarkColors.text),
    bodyMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 14, color: AppDarkColors.text),
    titleSmall: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppDarkColors.text),
    titleMedium: TextStyle(
        fontFamily: getFontFamily, fontSize: 18, color: AppDarkColors.text),
    titleLarge: TextStyle(
        fontFamily: getFontFamily, fontSize: 16, color: AppDarkColors.text),
  ),
  scaffoldBackgroundColor: AppDarkColors.background,
  brightness: Brightness.dark,
  indicatorColor: Colors.blue,
  primaryColor: AppColors.primary,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
    foregroundColor: Colors.black,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  expansionTileTheme: const ExpansionTileThemeData(
    backgroundColor: Color.fromRGBO(183, 183, 183, 1),
    collapsedBackgroundColor: Color.fromRGBO(183, 183, 183, 1),
  ),
);

// String get getFontFamily => 'Lato';
//
// String get getRegFontFamily => 'Lato';
//
// String get getMedFontFamily => 'Lato';

String get getFontFamily => 'Nunito';
