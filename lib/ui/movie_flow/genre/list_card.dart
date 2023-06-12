import 'package:cinema_score/core/data/models/genre.dart';
import 'package:cinema_score/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget{
  const ListCard({super.key, required this.genre, required this.onTap});

  final Genre genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        color: genre.isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(mBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(mBorderRadius),
          onTap: onTap,
          child: Container(
            width: 180,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              genre.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

}