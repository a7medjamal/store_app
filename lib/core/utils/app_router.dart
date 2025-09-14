import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/login_with_email_view.dart';
import 'package:store_app/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const String kOnboardingView = '/';
  static const String kLoginView = '/loginView';
  static const String kLoginWithEmailView = '/loginWithEmailView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(path: kLoginWithEmailView, builder: (context, state) => const LoginWithEmailView()),
    ],
  );
}
