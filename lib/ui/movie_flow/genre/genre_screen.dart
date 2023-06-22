import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/genre/list_card.dart';
import 'package:cinema_score/ui/movie_flow/movie_flow_controller.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Choose your favourite genre",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: mListItemSpacing),
                  itemBuilder: (context, index) {
                    final genre = ref.watch(movieFlowControllerProvider).genres[index];
                    return ListCard(
                      genre: genre,
                      onTap: () => ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: mListItemSpacing,
                    );
                  },
                  itemCount: ref.watch(movieFlowControllerProvider).genres.length),
            ),
            PrimaryButton(
              onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: "Continue",
            ),
            const SizedBox(
              height: mMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}
