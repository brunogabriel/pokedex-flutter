import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/cache/application_cache.dart';

void main() {
  late ApplicationCache applicationCache;

  setUp(() {
    applicationCache = MemoryCacheImpl();
  });

  test(
      'should save data '
      'in memory', () {
    final dynamic = {'object': 'value'};
    applicationCache.putValue('key', dynamic);
    expect(applicationCache.getValue('key'), dynamic);
  });
}
