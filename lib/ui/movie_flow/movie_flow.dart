import 'package:cinema_score/theme/colors.dart';
import 'package:cinema_score/ui/movie_flow/genre/genre_screen.dart';
import 'package:cinema_score/ui/movie_flow/landing/landing_screen.dart';
import 'package:flutter/material.dart';

class MovieFlow extends StatefulWidget{
  const MovieFlow({super.key});

  @override
  MovieFlowState createState() => MovieFlowState();
}

class MovieFlowState extends State<MovieFlow>{
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
        Scaffold(body: Container(color: Rang.accentColor,),),
        Scaffold(body: Container(color: Rang.red500,),),

      ],
    );
  }

}