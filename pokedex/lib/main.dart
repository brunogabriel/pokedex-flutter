import 'package:flutter/material.dart';
import 'package:pokedex/design/theme/pokedex_theme_data.dart';
import 'package:pokedex/di/injection.dart';

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
      theme: PokedexThemeData.themeData,
    );
  }
}
