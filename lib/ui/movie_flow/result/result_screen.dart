import 'package:cinema_score/core/models/movie.dart';
import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/movie_flow_controller.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerWidget{
  const ResultScreen({super.key});
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
      builder: (context) => const ResultScreen(),
  );

  final double movieHeight = 150;
  /*final movie = const Movie(
    title: 'John Wick',
    overView: 'A hit man got pissed off and takes the revenge of a dog killed by a spoiled gangster kid.',
    voteAverage: 6.7,
    genres: [Genre(name: 'Action'), Genre(name: 'Drama')],
    releaseDate: '2023-02-22',
    backdropPath: '',
    posterPath: '',
  );*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetails(
                        movie: ref.watch(movieFlowControllerProvider).movie,
                        movieHeight: movieHeight
                      ),
                    )
                  ],
                ),
                SizedBox(height: movieHeight / 2,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    ref.watch(movieFlowControllerProvider).movie.overView,
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: "Find another movie",
          ),
          const SizedBox(height: mMediumSpacing,),
        ],
      ),
    );
  }
}

class CoverImage extends ConsumerWidget{
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(minHeight: 300),
      child: ShaderMask(
        shaderCallback: (rect){
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent
            ]
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget{
  const MovieImageDetails({super.key, required this.movie, required this.movieHeight});

  final Movie movie;
  final double movieHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: movieHeight,
            child: const Placeholder(

            ),
          ),
          const SizedBox(width: mMediumSpacing,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  movie.genresCommaSeparated,
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6)
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}