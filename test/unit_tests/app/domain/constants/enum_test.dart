import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Enums', () {
    ThemeMode.values.forEach((ThemeMode mode) {
      test('should describe the name for ${mode.toString()}', () {
        expect(mode.name, describeEnum(mode));
      });
    });
  });
}
