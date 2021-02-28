import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ImcApp/main.dart';

void main() {
  testWidgets('Should create form as expected', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Key('nome')), findsOneWidget);
    expect(find.byKey(Key('altura')), findsOneWidget);
    expect(find.byKey(Key('peso')), findsOneWidget);
    expect(find.byKey(Key('calculo_button')), findsOneWidget);
    expect(find.byKey(Key('imc_resultado')), findsNothing);
  });
}
