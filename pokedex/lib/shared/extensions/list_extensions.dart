import 'package:pokedex_flutter/shared/data/pair.dart';

extension ListExtensions<A> on List<A> {
  List<Pair<A, B>> zip<B>(List<B> next) {
    if (length == next.length) {
      return asMap()
          .entries
          .map((e) => Pair(this[e.key], next[e.key]))
          .toList();
    }
    return [];
  }
}
