import 'package:go_router/go_router.dart';
import 'package:pokedex/sandbox.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const Sandbox(),
      )
    ],
  );
}
