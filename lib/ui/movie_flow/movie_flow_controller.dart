import 'package:cinema_score/core/models/genre.dart';
import 'package:cinema_score/ui/movie_flow/movie_flow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_flow_state.dart';

final movieFlowControllerProvider =
    StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>((ref) {
  return MovieFlowController(MovieFlowState(pageController: PageController()));
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(super.state);

  void toggleSelected(Genre genre) {
    state = state.copyWith(genres: [
      for (final oldGenre in state.genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ]);
  }

  void updateRating(double updatedRating) {
    state = state.copyWith(rating: updatedRating);
  }

  void updateYearsBack(int updatedYearsBack) {
    state = state.copyWith(yearsBack: updatedYearsBack);
  }

  void nextPage() {
    if (state.pageController.page! > 1) {
      if (!state.genres.any((element) => element.isSelected == true)) {
        return;
      }
    }

    state.pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInCubic,
    );
  }

  void previousPage() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
