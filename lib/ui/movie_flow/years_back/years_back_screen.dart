import 'package:cinema_score/core/utils/constants.dart';
import 'package:cinema_score/ui/movie_flow/result/result_screen.dart';
import 'package:cinema_score/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YearsBackScreen extends StatefulWidget{
  YearsBackScreen({super.key, required this.nextPage, required this.previousPage});

  VoidCallback nextPage;
  VoidCallback previousPage;

  @override
  _YearsBackScreenState createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen>{
  double yearsBack = 10;

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
              "How many years back should be check for?",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "${yearsBack.ceil()}",
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
                setState(() {
                  yearsBack = value;
                });
              },
              value: yearsBack,
              min: 0,
              max: 100,
              divisions: 100,
              label: "${yearsBack.ceil()}",
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