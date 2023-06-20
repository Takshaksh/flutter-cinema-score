import 'package:cinema_score/core/models/genre.dart';
import 'package:cinema_score/core/models/movie.dart';
import 'package:cinema_score/core/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MovieFlowState{
  final PageController pageController;
  final double rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.movie = movieMock,
    this.genres = genresMock,
    this.rating = 6.5,
    this.yearsBack = 10,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    double? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie
  }){
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieFlowState &&
          pageController == other.pageController &&
          rating == other.rating &&
          yearsBack == other.yearsBack &&
          genres == other.genres &&
          movie == other.movie;

  @override
  int get hashCode =>
      pageController.hashCode ^ rating.hashCode ^ yearsBack.hashCode ^ genres.hashCode ^ movie.hashCode;
}