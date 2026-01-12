import 'package:flutter_test/flutter_test.dart';
import 'package:speechtree_aac/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SpeechTreeApp());

    // Verify that the app title is displayed
    expect(find.text('SpeechTree AAC'), findsOneOrMore);
    expect(find.text('Welcome to SpeechTree AAC'), findsOneWidget);
  });
}
