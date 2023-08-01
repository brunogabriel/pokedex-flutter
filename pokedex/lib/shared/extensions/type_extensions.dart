import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';

extension ListTypeExtensions on List<Type> {
  List<Pair<String, double>> get damageFrom {
    final damage = <String, double>{};

    forEach((type) {
      for (var it in type.damageRelations.noDamageFrom) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 0.0;
        } else {
          damage[it.name] = 0.0;
        }
      }

      for (var it in type.damageRelations.halfDamageFrom) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 0.5;
        } else {
          damage[it.name] = 0.5;
        }
      }

      for (var it in type.damageRelations.doubleDamageFrom) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 2.0;
        } else {
          damage[it.name] = 2.0;
        }
      }
    });

    // fill anothers with 0

    return damage.entries.map((e) => Pair(e.key, e.value)).toList();
  }

  List<Pair<String, double>> get damageTo {
    final damage = <String, double>{};

    forEach((type) {
      for (var it in type.damageRelations.noDamageTo) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 0.0;
        } else {
          damage[it.name] = 0.0;
        }
      }

      for (var it in type.damageRelations.halfDamageTo) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 0.5;
        } else {
          damage[it.name] = 0.5;
        }
      }

      for (var it in type.damageRelations.doubleDamageTo) {
        if (damage.containsKey(it.name)) {
          damage[it.name] = damage[it.name]! * 2.0;
        } else {
          damage[it.name] = 2.0;
        }
      }
    });

    return damage.entries.map((e) => Pair(e.key, e.value)).toList();
  }

  // TODO: All
  List<Type> get xx {
    final types = <Type>[];

    // types.fold(<Type>{}, (previousValue, element) =>
    //   element.damageRelations.
    // )

    // forEach((type) {

    // });

    return types;
  }
}
