import 'package:cinema_score/theme/colors.dart';
import 'package:cinema_score/ui/movie_flow/genre/genre_screen.dart';
import 'package:cinema_score/ui/movie_flow/landing/landing_screen.dart';
import 'package:cinema_score/ui/movie_flow/rating/rating_screen.dart';
import 'package:cinema_score/ui/movie_flow/years_back/years_back_screen.dart';
import 'package:flutter/material.dart';

class MovieFlow extends StatefulWidget{
  const MovieFlow({super.key});

  @override
  _MovieFlowState createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow>{
  final pageController = PageController();

  void nextPage(){
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic
    );
  }

  void previousPage(){
    pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCubic
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(), // disables swipes by finger
      children: [
        LandingScreen(nextPage: nextPage, previousPage: previousPage),
        GenreScreen(nextPage: nextPage, previousPage: previousPage),
        RatingScreen(nextPage: nextPage, previousPage: previousPage),
        YearsBackScreen(nextPage: nextPage, previousPage: previousPage),
      ],
    );
  }

}