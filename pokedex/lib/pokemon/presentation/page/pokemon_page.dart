import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokemon/domain/interactor/pokemon_interactor.dart';

import '../../../shared/widgets/pokemon_widget.dart';
import '../../domain/model/pokemon.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late IPokemonInteractor _interactor;

  @override
  void initState() {
    _interactor = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: _buildPokemonGrid(),
    );
  }

  Widget _buildPokemonGrid() {
    return FutureBuilder<List<Pokemon>>(
      future: _interactor.takePokemons(),
      builder: (builder, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            primary: false,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: (snapshot.data ?? const <Pokemon>[])
                .map((pokemon) => PokemonWidget(
                      name: pokemon.name,
                      number: pokemon.number.toString(),
                      thumbnail: pokemon.thumbnail,
                    ))
                .toList(),
          );
        } else if (snapshot.hasError) {
          return const Text('Has error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
