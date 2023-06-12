import 'package:cinema_score/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme{
  static ThemeData darkTheme(BuildContext context){
    final theme = Theme.of(context);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
            Rang.red500.value,
            const {
              100: Rang.red100,
              200: Rang.red200,
              300: Rang.red300,
              400: Rang.red400,
              500: Rang.red500,
              600: Rang.red600,
              700: Rang.red700,
              800: Rang.red800,
              900: Rang.red900,
            }
        ),
        accentColor: Rang.red500,
      ),
      scaffoldBackgroundColor: Rang.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Rang.black
      ),
      textTheme: theme.primaryTextTheme.copyWith(
        labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ).apply(
        // this applies colors to every text (heading, body, display)
        displayColor: Colors.white
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Rang.red500
        )
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Rang.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent
      ),
    );
  }
}