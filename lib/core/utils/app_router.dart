import 'package:go_router/go_router.dart';
import 'package:store_app/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
    ],
  );
}
