import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/data/evolution_repository.dart';
import 'package:pokedex_flutter/feature/evolution/domain/entity/evolution_entity.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

abstract class EvolutionUseCase {
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon);
}

@Injectable(as: EvolutionUseCase)
class EvolutionUseCaseImpl implements EvolutionUseCase {
  EvolutionUseCaseImpl(this._repository);

  final EvolutionRepository _repository;

  @override
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon) async {
    final evolutionChain = await _repository.getEvolutionChain(pokemon.id);

    return EvolutionEntity(
      pokemon: pokemon,
      evolutions: _convert(_bfsEvolutions(evolutionChain.chain)),
    );
  }

  List<Pair<ChainLink, ChainLink>> _bfsEvolutions(ChainLink node) {
    Queue<ChainLink> queue = Queue();
    Set<ChainLink> visited = {};
    List<Pair<ChainLink, ChainLink>> evolutions = [];
    queue.add(node);

    while (queue.isNotEmpty) {
      ChainLink current = queue.removeFirst();
      for (ChainLink neighbor in current.evolvesTo) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
          visited.add(neighbor);
          evolutions.add(Pair(current, neighbor));
        }
      }
    }

    return evolutions;
  }

  // TODO: Convert to a function (cause too)
  List<EvolutionDescriptionEntity> _convert(
      List<Pair<ChainLink, ChainLink>> evolutions) {
    return evolutions.map(
      (evol) {
        List<String> subCauses = [];
        List<String> sprites = [];
        String mainCause = '';
        try {
          final evolvesTo = evol.second;
          final String trigger;
          if (evolvesTo.evolutionDetails.isNotEmpty) {
            trigger = evolvesTo.evolutionDetails.first.trigger.name;
          } else {
            trigger = '';
          }

          if (trigger == 'level-up') {
            if (evolvesTo.evolutionDetails.first.minLevel != null) {
              mainCause = 'Level ${evolvesTo.evolutionDetails.first.minLevel}';
            } else {
              mainCause = 'Level up';
            }
            sprites.add(_toSprite('rare-candy'));
          } else if (trigger == 'use-item') {
            mainCause = evolvesTo.evolutionDetails.first.item?.name
                    .capitalizeKebabCase() ??
                '';

            sprites.add(_toSprite(evolvesTo.evolutionDetails.first.item?.name));
          } else if (trigger == 'other') {
            mainCause = 'Another';
          } else if (trigger == 'trade') {
            mainCause = 'Trade';
          } else {
            mainCause = 'Unknown';
          }

          _subCause(sprites, subCauses, evolvesTo);
        } catch (_) {}

        return EvolutionDescriptionEntity(
          from: evol.first.species.name.capitalize(),
          to: evol.second.species.name.capitalize(),
          fromNumber: evol.first.species.url.getNumberFromPokemonUrl(),
          toNumber: evol.second.species.url.getNumberFromPokemonUrl(),
          cause: mainCause,
          sprites: sprites,
          details: subCauses.join('\n'),
        );
      },
    ).toList();
  }

  void _subCause(
      List<String> sprites, List<String> subcauses, ChainLink evolvesTo) {
    // if (evolvesTo.evolutionDetails.first.minLevel != null) {
    //   subcauses.add('Level ${evolvesTo.evolutionDetails.first.minLevel}');
    // }

    // if (evolvesTo.evolutionDetails.first.item != null) {
    //   subcauses.add(
    //       evolvesTo.evolutionDetails.first.item?.name.capitalizeKebabCase() ??
    //           '');
    // }

    if (evolvesTo.evolutionDetails.first.minHappiness != null) {
      sprites.add(_toSprite('soothe-bell'));
      // TODO: while friendship is high
      subcauses
          .add('happiness ${evolvesTo.evolutionDetails.first.minHappiness}');
    }

    if (evolvesTo.evolutionDetails.first.minAffection != null) {
      subcauses
          .add('affection ${evolvesTo.evolutionDetails.first.minAffection}');
    }

    if (evolvesTo.evolutionDetails.first.minBeauty != null) {
      subcauses.add('beauty ${evolvesTo.evolutionDetails.first.minBeauty}');
    }

    if (evolvesTo.evolutionDetails.first.knownMove != null) {
      sprites.add(_toSprite('tm-electric'));
      subcauses.add(
          'knowing ${evolvesTo.evolutionDetails.first.knownMove?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.location != null) {
      sprites.add(_toSprite('town-map'));
      subcauses.add(
          'in a ${evolvesTo.evolutionDetails.first.location?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.timeOfDay.isNotEmpty) {
      subcauses.add(evolvesTo.evolutionDetails.first.timeOfDay.capitalize());
    }

    if (evolvesTo.evolutionDetails.first.gender != null) {
      subcauses.add(evolvesTo.evolutionDetails.first.gender == 1
          ? 'if female'
          : 'if male');
    }

    if (evolvesTo.evolutionDetails.first.heldItem != null) {
      sprites.add(_toSprite(evolvesTo.evolutionDetails.first.heldItem?.name));
      subcauses.add(
          'holding ${evolvesTo.evolutionDetails.first.heldItem?.name.capitalizeKebabCase()}');
    }
  }

  String _toSprite(String? name) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$name.png';
  }
}
