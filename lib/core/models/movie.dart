import 'package:flutter/foundation.dart';

import 'genre.dart';

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
    posterPath = '';

  String get genresCommaSeparated => genres.map((e) => e.name).toList().join(', ');

  @override
  String toString(){
    return 'Movie(title: $title, overview: $overView, voteAverage: $voteAverage, genres: $genres)';
  }

  @override
  bool operator == (Object other){
    if(identical(this, other)) return true;

    return other is Movie &&
        other.title == title &&
        other.overView == overView &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode{
    return title.hashCode ^ overView.hashCode ^ voteAverage.hashCode ^ genres.hashCode ^ releaseDate.hashCode;
  }
}