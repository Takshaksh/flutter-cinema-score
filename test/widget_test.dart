import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cinema_score/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CinemaScoreApp());

  });
}
