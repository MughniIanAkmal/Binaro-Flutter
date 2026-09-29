import 'package:flutter_test/flutter_test.dart';
import 'package:binaro_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BinaroApp());
    expect(find.text('Daftar Mapel'), findsOneWidget);
  });
}
