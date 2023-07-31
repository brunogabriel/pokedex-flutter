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
        List<String> causes = [];
        List<String> sprites = [];
        try {
          final evolvesTo = evol.second;
          final String trigger;
          if (evolvesTo.evolutionDetails.isNotEmpty) {
            trigger = evolvesTo.evolutionDetails.first.trigger.name;
          } else {
            trigger = '';
          }

          if (trigger == 'level-up') {
            sprites.add(_toSprite('rare-candy'));
          } else if (trigger == 'use-item') {
            sprites.add(_toSprite(evolvesTo.evolutionDetails.first.item?.name));
            causes.add(evolvesTo.evolutionDetails.first.item?.name
                    .capitalizeKebabCase() ??
                '');
          } else if (trigger == 'other') {
            causes.add('Other');
          } else if (trigger == 'trade') {
            causes.add('Trade');
          }

          _subCause(sprites, causes, evolvesTo);
        } catch (_) {}

        return EvolutionDescriptionEntity(
          from: evol.first.species.name.capitalize(),
          to: evol.second.species.name.capitalize(),
          fromNumber: evol.first.species.url.getNumberFromPokemonUrl(),
          toNumber: evol.second.species.url.getNumberFromPokemonUrl(),
          description: causes.join('\n'),
          sprites: sprites,
        );
      },
    ).toList();
  }

  void _subCause(
      List<String> sprites, List<String> causes, ChainLink evolvesTo) {
    if (evolvesTo.evolutionDetails.first.minLevel != null) {
      causes.add('Level ${evolvesTo.evolutionDetails.first.minLevel}');
    }

    if (evolvesTo.evolutionDetails.first.minHappiness != null) {
      sprites.add(_toSprite('soothe-bell'));

      causes.add('Happiness ${evolvesTo.evolutionDetails.first.minHappiness}');
    }

    if (evolvesTo.evolutionDetails.first.minAffection != null) {
      causes.add('Affection ${evolvesTo.evolutionDetails.first.minAffection}');
    }

    if (evolvesTo.evolutionDetails.first.minBeauty != null) {
      causes.add('Beauty ${evolvesTo.evolutionDetails.first.minBeauty}');
    }

    if (evolvesTo.evolutionDetails.first.knownMove != null) {
      sprites.add(_toSprite('tm-electric'));
      causes.add(
          'Knowing ${evolvesTo.evolutionDetails.first.knownMove?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.location != null) {
      sprites.add(_toSprite('town-map'));
      causes.add(
          'In a ${evolvesTo.evolutionDetails.first.location?.name.capitalizeKebabCase()}');
    }

    if (evolvesTo.evolutionDetails.first.timeOfDay.isNotEmpty) {
      causes.add(evolvesTo.evolutionDetails.first.timeOfDay.capitalize());
    }

    if (evolvesTo.evolutionDetails.first.gender != null) {
      causes.add(evolvesTo.evolutionDetails.first.gender == 1
          ? 'If female'
          : 'If male');
    }

    if (evolvesTo.evolutionDetails.first.heldItem != null) {
      sprites.add(_toSprite(evolvesTo.evolutionDetails.first.heldItem?.name));
      causes.add('Holding ${evolvesTo.evolutionDetails.first.heldItem?.name}');
    }
  }

  String _toSprite(String? name) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$name.png';
  }
}
