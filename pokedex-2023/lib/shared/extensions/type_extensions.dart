import 'package:pokedex/pokedex.dart';

extension ListTypeExtensions on List<Type> {
  Map<String, double> get damageFrom {
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

    return damage;
  }
}
