library theme;

import 'package:flutter/material.dart';

import 'app_color_ext.dart';

part 'colors.dart';
part 'fonts.dart';
part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.greenlight;
  const Color secondaryColor = _Colors.grey;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: _Colors.greenlight,
  );
  final themeData = ThemeData(
    useMaterial3: false,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: _Colors.scaffoldColor,
    dividerColor: _Colors.dividerColor,
    splashColor: _Colors.carouselPink0399,
    cardColor: _Colors.white,
    colorScheme: colorScheme,
    iconTheme: IconThemeData(color: primaryColor, size: 24),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return secondaryColor;
      }),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _Colors.appBarColor,
      centerTitle: false,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _Colors.greenlight,
      extendedTextStyle: _AppTextStyles.buttonText,
      foregroundColor: _Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: _AppTextStyles.bodyRegular,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        elevation: 0,
        backgroundColor: _Colors.greenlight,
        textStyle: _AppTextStyles.buttonText,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _AppTextStyles.textButtonText,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _Colors.greyLighter,
        side: BorderSide.none,
        elevation: 0,
        textStyle: _AppTextStyles.textButtonText.copyWith(
          color: _Colors.greyLighter,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        borderSide: BorderSide(color: _Colors.textFieldUnderlineColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        borderSide: BorderSide(color: _Colors.textFieldUnderlineColor),
      ),
      isDense: true,
      filled: true,
      fillColor: _Colors.white,
      hintStyle: _AppTextStyles.bodyRegular.copyWith(color: _Colors.grey),
    ),
    fontFamily: AppFont.dmSansRegular,
    textTheme: TextTheme(
      bodyLarge: _AppTextStyles.bodyBold,
      bodyMedium: _AppTextStyles.bodyRegular, // default text styling
      bodySmall: _AppTextStyles.bodySmall,
      displayLarge: _AppTextStyles.displayLarge,
      displayMedium: _AppTextStyles.displayMedium,
      displaySmall: _AppTextStyles.displaySmall,
      headlineLarge: _AppTextStyles.headingLarge,
      headlineMedium: _AppTextStyles.headingMedium,
      headlineSmall: _AppTextStyles.headingSmall,

      titleMedium: _AppTextStyles.textFieldBody, // TextFormField text style
      titleSmall: _AppTextStyles.textFieldCaption,

      ///for captions
      labelMedium: _AppTextStyles.bodyCaption,
      labelSmall: _AppTextStyles.textFieldCaption,
    ),
    extensions: [
      AppColorExtension(
        green: _Colors.green,
        orange: _Colors.orange,
        blue: _Colors.blueAccent,
        white: _Colors.white,
        black: _Colors.black,
        redDarker: _Colors.redDarker,
        redLighter: _Colors.redLighter,
        textFieldFillColor: _Colors.textFieldFillColor,
      ),
    ],
  );
  return themeData;
}
