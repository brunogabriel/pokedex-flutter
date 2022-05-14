import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/pokemon/data/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/pokemon/domain/interactor/pokemon_interactor.dart';
import 'package:pokedex/pokemon/domain/model/pokemon.dart';

import 'pokemon_interactor_test.mocks.dart';

@GenerateMocks([IPokemonRepository])
void main() {
  group('interactor flow', () {
    late IPokemonRepository repository;
    late IPokemonInteractor interactor;

    setUp(() {
      repository = MockIPokemonRepository();
      interactor = PokemonInteractor(repository);
    });

    test('should take pokemons successfully', () async {
      // given
      const offset = 10;
      final response = [
        const PokemonResponse(
            name: '1', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        const PokemonResponse(
            name: '2', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
      ];

      final pokemons = [
        Pokemon(
            name: '1',
            thumbnail:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
            number: 1),
        Pokemon(
            name: '2',
            thumbnail:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
            number: 2),
      ];

      when(repository.fetchPokemons(offset)).thenAnswer((_) async => response);

      // then
      assert(listEquals(await interactor.takePokemons(offset), pokemons));
    });
  });
}
