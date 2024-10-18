import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_list/presentation/pokemon_list_page.dart';

abstract class AppRoutes {
  AppRoutes._();

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (_, __) => const PokemonListPage(),
      )
    ],
  );
}
