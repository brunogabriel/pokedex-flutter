import 'package:collection/collection.dart';
import 'package:pokedex/pokedex.dart';

extension ListTypeExtensions on List<Type> {
  List<String> get weaknesses {
    final doubleDamageFrom = map((type) => type.damageRelations.doubleDamageFrom
            .map((resource) => resource.name))
        .expand((element) => element)
        .toList();

    final halfDamageFrom = map((type) => type.damageRelations.halfDamageFrom
            .map((resource) => resource.name))
        .expand((element) => element)
        .toList();

    final noDamageFrom = map((type) =>
            type.damageRelations.noDamageFrom.map((resource) => resource.name))
        .expand((element) => element)
        .toList();

    final weaknesses = doubleDamageFrom
        .whereNot((element) => halfDamageFrom.contains(element))
        .whereNot((element) => noDamageFrom.contains(element))
        .toSet()
        .sortedBy((element) => element)
        .toList();

    return weaknesses;
  }
}
