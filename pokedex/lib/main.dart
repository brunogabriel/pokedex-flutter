import 'package:flutter/material.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/pokemon/presentation/page/pokemon_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PokemonPage();
  }
}
