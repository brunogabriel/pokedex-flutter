import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
      )
    ],
  );
}
