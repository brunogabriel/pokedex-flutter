import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

import '../../../../shared/data/pair.dart';
import '../../../../shared/extensions/string_extensions.dart';
import '../entity/evolution_entity.dart';

abstract class EvolutionMapper {
  EvolutionDescriptionEntity toEntity(Pair<ChainLink, ChainLink> pair);
}

@Injectable(as: EvolutionMapper)
class EvolutionMapperImpl implements EvolutionMapper {
  @override
  EvolutionDescriptionEntity toEntity(Pair<ChainLink, ChainLink> pair) {
    List<String> sprites = [];
    List<String> subcauses = [];
    String mainCause = '';

    try {
      final evolvesTo = pair.second;
      final String trigger;

      if (evolvesTo.evolutionDetails.isNotEmpty) {
        trigger = evolvesTo.evolutionDetails.first.trigger.name;
      } else {
        trigger = '';
      }

      switch (trigger) {
        case 'level-up':
          if (evolvesTo.evolutionDetails.first.minLevel != null) {
            mainCause = 'Level ${evolvesTo.evolutionDetails.first.minLevel}';
          } else {
            mainCause = 'Level up with';
          }
          sprites.add('rare-candy'.itemThumbnail);
          break;
        case 'use-item':
          mainCause = evolvesTo.evolutionDetails.first.item?.name
                  .capitalizeKebabCase() ??
              '';
          sprites.add((evolvesTo.evolutionDetails.first.item?.name ?? '')
              .itemThumbnail);
          break;
        case 'other':
          mainCause = 'Another';
          break;
        case 'trade':
          mainCause = 'Trade';
          break;
        default:
          mainCause = 'Unknown';
          break;
      }
      _addSubcauses(evolvesTo, subcauses, sprites);
    } catch (_) {}

    return EvolutionDescriptionEntity(
      from: pair.first.species.name.capitalize(),
      to: pair.second.species.name.capitalize(),
      fromNumber: pair.first.species.url.getNumberFromPokemonUrl(),
      toNumber: pair.second.species.url.getNumberFromPokemonUrl(),
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
