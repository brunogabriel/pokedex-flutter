import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/pokemon/data/service/pokemon_service.dart';
import 'package:pokedex/shared/network/exception/network_exception.dart';

import 'pokemon_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('success flow', () {
    late Dio client;
    late IPokemonService service;

    setUp(() {
      client = MockDio();
      service = PokemonService(client);
    });

    test('should get pokemon from service and get status code 200', () async {
      // given
      const offset = 0;
      final expectedResponse = [
        const PokemonResponse(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/')
      ];

      when(client.get('/pokemon?limit=30&offset=0'))
          .thenAnswer((_) async => Response(
                data: json.decode(
                    '{"count":1126,"next":"https://pokeapi.co/api/v2/pokemon?offset=1&limit=1","previous":null,"results":[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}]}'),
                requestOptions: RequestOptions(path: ""),
                statusCode: 200,
              ));

      // then
      assert(listEquals(await service.getPokemons(offset), expectedResponse));
    });
  });

  group('error flow', () {
    late Dio client;
    late IPokemonService service;

    setUp(() {
      client = MockDio();
      service = PokemonService(client);
    });

    test('should treat error', () async {
      // given
      const offset = 0;

      when(client.get('/pokemon?limit=30&offset=0'))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ""),
                statusCode: 404,
              ));

      // then
      expect(
          () => service.getPokemons(offset), throwsA(isA<NetworkException>()));
    });
  });
}
