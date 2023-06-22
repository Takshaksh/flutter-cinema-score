import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/result/result_screen.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movie_flow_controller.dart';

class YearsBackScreen extends ConsumerWidget{
  const YearsBackScreen({super.key});

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
              "How many years back should be check for?",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "${ref.watch(movieFlowControllerProvider).yearsBack}",
                  style: theme.textTheme.headlineLarge,
                ),
                Text(
                  "Years back",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.textTheme.headlineSmall?.color?.withOpacity(.60),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value){
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(value.toInt());
              },
              value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: "${ref.watch(movieFlowControllerProvider).yearsBack}",
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: (){
                Navigator.of(context).push(ResultScreen.route());
              },
              text: "Amazing",
            ),
            const SizedBox(height: mMediumSpacing,)
          ],
        ),
      ),
    );
  }
}