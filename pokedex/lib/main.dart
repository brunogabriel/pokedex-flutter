import 'package:flutter/material.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/pokemon/presentation/view/pokemon_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pokedex - 250 Pokémons')),
        body: const PokemonPage(),
      ),
    );
  }
}
