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

  List<Pair<A, A>> zipWithNext() {
    if (length < 2) {
      return [];
    }

    List<Pair<A, A>> result = [];

    for (int i = 0; i < length - 1; i++) {
      result.add(Pair(this[i], this[i + 1]));
    }
    return result;
  }
}
