import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/common/extensions/double_extensions.dart';

void main() {
  test(
    'should convert to effectiness factor',
    () {
      expect(0.5.toEffectivenessFactor(), '½');
      expect(0.25.toEffectivenessFactor(), '¼');
      expect(0.0.toEffectivenessFactor(), '*');
      expect(1.0.toEffectivenessFactor(), '1');
    },
  );
}
