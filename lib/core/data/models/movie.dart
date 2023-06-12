
import 'package:cinema_score/core/data/models/genre.dart';
import 'package:flutter/foundation.dart';

@immutable
class Movie{
  final String title;
  final String overView;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title, required this.overView, required this.voteAverage,
    required this.genres, required this.releaseDate, this.backdropPath, this.posterPath
  });

  Movie.initial() :
    title = '',
    overView = '',
    voteAverage = 0,
    genres = [],
    releaseDate = '',
    backdropPath = '',
    posterPath = ''
  ;

}