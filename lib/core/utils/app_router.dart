import 'package:go_router/go_router.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
    ],
  );
}