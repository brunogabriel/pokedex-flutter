import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/pokemon/data/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/pokemon/data/service/pokemon_service.dart';

import 'pokemon_repository_test.mocks.dart';

@GenerateMocks([IPokemonService])
void main() {
  group('repository tests', () {
    late IPokemonService service;
    late IPokemonRepository repository;
    setUp(() {
      service = MockIPokemonService();
      repository = PokemonRepository(service);
    });

    test('should get pokemons', () async {
      // given
      const offset = 10;
      final List<PokemonResponse> response = [
        const PokemonResponse(name: '1', url: '1'),
        const PokemonResponse(name: '2', url: '2')
      ];

      when(service.getPokemons(offset)).thenAnswer((_) async => response);

      // when
      expect(await repository.fetchPokemons(offset), response);
    });
  });
}
