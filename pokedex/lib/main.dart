import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/pokemon/presentation/view/pokemon_page.dart';
import 'package:pokedex/shared/network/utils/pokemon_http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = PokemonHttpOverrides();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: Scaffold(
        appBar: AppBar(title: const Text('Pokedex - 250 Pokémons')),
        body: const PokemonPage(),
      ),
    );
  }
}
