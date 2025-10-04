import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/services/auth_service.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:store_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:store_app/features/auth/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:store_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:store_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:store_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/cubit/logout_cubit.dart';
import 'package:store_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:store_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final firebaseAuth = FirebaseAuth.instance;
  final authRemote = AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth);
  final authRepo = AuthRepositoryImpl(remoteDataSource: authRemote);
  final updatePasswordUseCase = UpdatePasswordUseCase(authRepo: authRepo);
  final authService = AuthService(firebaseAuth: firebaseAuth, prefs: prefs);
  UserEntity? loggedInUser = await authService.autoLogin();
  final initialRoute = loggedInUser != null
      ? AppRouter.kHomeView
      : AppRouter.kOnboardingView;
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: updatePasswordUseCase),
        RepositoryProvider.value(value: authService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LoginCubit(LoginUseCase(authRepo), authService),
          ),
          BlocProvider(create: (_) => SignUpCubit(SignUpUseCase(authRepo))),
          BlocProvider(
            create: (_) =>
                LogoutCubit(authRepo: authRepo, authService: authService),
          ),
        ],
        child: StoreApp(initialRoute: initialRoute),
      ),
    ),
  );
}

class StoreApp extends StatelessWidget {
  final String initialRoute;

  const StoreApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router(initialRoute),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: 'Satoshi',
      ),
    );
  }
}
