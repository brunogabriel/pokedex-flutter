import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/design/pokedex_theme_data.dart';
import 'package:pokedex/di/injection.dart';
import 'package:pokedex/routes/app_routes.dart';
import 'package:pokedex/theme/cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => GetIt.I.get<ThemeCubit>(),
        child: const PokemonApplication(),
      );
}

class PokemonApplication extends StatelessWidget {
  const PokemonApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (_, state) {
        return MaterialApp.router(
          theme: PokedexThemeData.lightThemeData,
          darkTheme: PokedexThemeData.darkThemeData,
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
