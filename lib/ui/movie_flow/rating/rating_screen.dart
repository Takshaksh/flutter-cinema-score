import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/movie_flow_controller.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

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
              "Select rating between 1-10",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${ref.read(movieFlowControllerProvider).rating}",
                  style: theme.textTheme.headlineLarge,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62,
                ),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateRating(value);
              },
              value: ref.watch(movieFlowControllerProvider).rating,
              min: 1,
              max: 10,
              divisions: 10,
              label: "${ref.watch(movieFlowControllerProvider).rating}",
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: "Yes please",
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
