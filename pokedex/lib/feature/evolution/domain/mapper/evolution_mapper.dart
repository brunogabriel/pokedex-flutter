import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/domain/entity/evolution_entity.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

extension EvolutionMapper on Pair<ChainLink, ChainLink> {
  static const _levelUp = 'level-up';
  static const _rareCandy = 'rare-candy';
  static const _useItem = 'use-item';
  static const _other = 'other';
  static const _trade = 'trade';

  EvolutionDescriptionEntity toEntity() {
    List<String> sprites = [];
    List<String> subcauses = [];
    String mainCause = '';
    try {
      final evolvesTo = second;
      final String trigger;

      if (evolvesTo.evolutionDetails.isNotEmpty) {
        trigger = evolvesTo.evolutionDetails.first.trigger.name;
      } else {
        trigger = '';
      }

      switch (trigger) {
        case _levelUp:
          if (evolvesTo.evolutionDetails.first.minLevel != null) {
            mainCause = 'Level ${evolvesTo.evolutionDetails.first.minLevel}';
          } else {
            mainCause = 'Level up with';
          }
          sprites.add(_rareCandy.itemThumbnail);
          break;
        case _useItem:
          mainCause = evolvesTo.evolutionDetails.first.item?.name
                  .capitalizeKebabCase() ??
              '';
          sprites.add((evolvesTo.evolutionDetails.first.item?.name ?? '')
              .itemThumbnail);
          break;
        case _other:
          mainCause = 'Another';
          break;
        case _trade:
          mainCause = 'Trade';
          break;

        default:
          mainCause = 'Unknown';
          break;
      }

      _addSubcauses(evolvesTo, subcauses, sprites);
    } catch (_) {}

    return EvolutionDescriptionEntity(
      from: first.species.name.capitalize(),
      to: second.species.name.capitalize(),
      fromNumber: first.species.url.getNumberFromPokemonUrl(),
      toNumber: second.species.url.getNumberFromPokemonUrl(),
      cause: mainCause,
      sprites: sprites,
      details: subcauses.join('\n'),
    );
  }

  void _addSubcauses(
      ChainLink evolvesTo, List<String> subcauses, List<String> sprites) {
    if (evolvesTo.evolutionDetails.first.minHappiness != null) {
      sprites.add('soothe-bell'.itemThumbnail);
      subcauses.add(
          'high friendship (${evolvesTo.evolutionDetails.first.minHappiness})');
    }

    if (evolvesTo.evolutionDetails.first.minAffection != null) {
      subcauses.add(
          'high affection (${evolvesTo.evolutionDetails.first.minAffection})');
    }

    if (evolvesTo.evolutionDetails.first.minBeauty != null) {
      subcauses
          .add('high beauty (${evolvesTo.evolutionDetails.first.minBeauty})');
    }

    if (evolvesTo.evolutionDetails.first.knownMove != null) {
      sprites.add('tm-electric'.itemThumbnail);
      subcauses.add(
          'knowing ${evolvesTo.evolutionDetails.first.knownMove?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.location != null) {
      sprites.add('town-map'.itemThumbnail);
      subcauses.add(
          'in a ${evolvesTo.evolutionDetails.first.location?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.timeOfDay.isNotEmpty) {
      subcauses.add(
          'during the ${evolvesTo.evolutionDetails.first.timeOfDay.capitalize()}');
    }

    if (evolvesTo.evolutionDetails.first.gender != null) {
      subcauses.add(evolvesTo.evolutionDetails.first.gender == 1
          ? 'if female'
          : 'if male');
    }

    if (evolvesTo.evolutionDetails.first.heldItem != null) {
      sprites.add((evolvesTo.evolutionDetails.first.heldItem?.name ?? '')
          .itemThumbnail);
      subcauses.add(
          'holding ${evolvesTo.evolutionDetails.first.heldItem?.name.capitalizeKebabCase()}');
    }
  }
}
