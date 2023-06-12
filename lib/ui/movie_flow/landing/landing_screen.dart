import 'package:cinema_score/core/utils/asset_manager.dart';
import 'package:cinema_score/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/primary_button.dart';

class LandingScreen extends ConsumerWidget{
  const LandingScreen({Key? key, required this.nextPage, required this.previousPage}) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's rate a movie",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset(AssetManager.movieBoy, width: 300, height: 300,),
            const Spacer(),
            PrimaryButton(
              onPressed: nextPage,
              text: "Get Started"
            ),
            const SizedBox(height: mMediumSpacing,)
          ],
        ),
      ),
    );
  }

}