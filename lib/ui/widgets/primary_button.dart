import 'dart:developer';

import 'package:cinema_score/core/utils/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget{
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    log(text);
    log(width.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mBorderRadius / 2),
          ),
          fixedSize: Size(width, 48),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
      ),
    );
  }

}