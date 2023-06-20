import 'package:cinema_score/ui/movie_flow/movie_flow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_flow_state.dart';

final MovieFlowControllerProvider = StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>((ref) {
  return MovieFlowController(
    MovieFlowState(
      pageController: PageController()
    )
  );
});

class MovieFlowController extends StateNotifier<MovieFlowState>{
  MovieFlowController(super.state);

}