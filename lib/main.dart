import 'package:cinema_score/theme/custom_theme.dart';
import 'package:cinema_score/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: CinemaScoreApp()));
}

class CinemaScoreApp extends StatelessWidget {
  const CinemaScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Score',
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.darkTheme(context),
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      home: const HomeScreen(),
    );
  }
}