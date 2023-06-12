import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget{
  RatingScreen({super.key, required this.nextPage, required this.previousPage});

  VoidCallback nextPage;
  VoidCallback previousPage;

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen>{
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
                Text("${rating.ceil()}", style: theme.textTheme.headlineLarge,),
                const Icon(Icons.star_rounded, color: Colors.amber, size: 62,),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value){
                setState(() {
                  rating = value;
                });
              },
              value: rating,
              min: 1,
              max: 10,
              divisions: 10,
              label: "${rating.ceil()}",
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: widget.nextPage,
              text: "Yes please",
            ),
            const SizedBox(height: mMediumSpacing,)
          ],
        ),
      ),
    );
  }
}