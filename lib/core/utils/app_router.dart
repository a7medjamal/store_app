import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:store_app/features/auth/presentation/views/forget_pasword_view.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/login_with_email_view.dart';
import 'package:store_app/features/auth/presentation/views/otp_view.dart';
import 'package:store_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:store_app/features/auth/presentation/views/sign_up_with_email_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const String kOnboardingView = '/';
  static const String kLoginView = '/loginView';
  static const String kLoginWithEmailView = '/loginWithEmailView';
  static const String kSignUpView = '/signUpView';
  static const String kSignUpWithEmailView = '/signUpWithEmailView';
  static const String kForgetPasswordView = '/forgetPasswordView';
  static const String kHomeView = '/homeView';
  static const String kOtpView = '/otpView';
  static const String kCreateNewPasswordView = '/createNewPasswordView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kLoginWithEmailView,
        builder: (context, state) => const LoginWithEmailView(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kSignUpWithEmailView,
        builder: (context, state) => const SignUpWithEmailView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kOtpView, builder: (context, state) => const OtpView()),
      GoRoute(
        path: kCreateNewPasswordView,
        builder: (context, state) => const CreateNewPasswordView(),
      ),
    ],
  );
}
