// Mocks generated by Mockito 5.1.0 from annotations
// in pokedex/test/pokemon/data/repository/pokemon_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/pokemon/data/response/pokemon_response.dart' as _i4;
import 'package:pokedex/pokemon/data/service/pokemon_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [IPokemonService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPokemonService extends _i1.Mock implements _i2.IPokemonService {
  MockIPokemonService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.PokemonResponse>> getPokemons(int? offset) =>
      (super.noSuchMethod(Invocation.method(#getPokemons, [offset]),
              returnValue: Future<List<_i4.PokemonResponse>>.value(
                  <_i4.PokemonResponse>[]))
          as _i3.Future<List<_i4.PokemonResponse>>);
}
