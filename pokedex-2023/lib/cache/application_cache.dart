import 'package:injectable/injectable.dart';

abstract class ApplicationCache {
  dynamic getValue(String key);
  void putValue(String key, dynamic value);
}

@Singleton(as: ApplicationCache)
class MemoryCacheImpl implements ApplicationCache {
  final Map<String, dynamic> _memoryMap = {};

  @override
  getValue(String key) {
    return _memoryMap[key];
  }

  @override
  void putValue(String key, value) {
    _memoryMap[key] = value;
  }
}
