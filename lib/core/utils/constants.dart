import '../models/genre.dart';
import '../models/movie.dart';

const mBorderRadius = 8.0;
const mListItemSpacing = 12.0;
const mMediumSpacing = 24.0;

const movieMock = Movie(
  title: 'John Wick',
  overView: 'A hit man got pissed off and takes the revenge of a dog killed by a spoiled gangster kid.',
  voteAverage: 6.7,
  genres: [Genre(name: 'Action'), Genre(name: 'Drama')],
  releaseDate: '2023-02-22',
  backdropPath: '',
  posterPath: '',
);

const genresMock = [
  Genre(name: "Sci-fi"),
  Genre(name: 'Drama'),
  Genre(name: 'Comedy'),
  Genre(name: 'Horror'),
  Genre(name: 'Family'),
  Genre(name: 'Romance'),
  Genre(name: 'Animated'),
];