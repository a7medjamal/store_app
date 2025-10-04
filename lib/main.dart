import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:store_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:store_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:store_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:store_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:store_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:store_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final firebaseAuth = FirebaseAuth.instance;
  final authRemote = AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth);
  final authRepo = AuthRepositoryImpl(remoteDataSource: authRemote);
  final updatePasswordUseCase = UpdatePasswordUseCase(authRepo: authRepo);

  runApp(
    MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: updatePasswordUseCase)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginCubit(LoginUseCase(authRepo))),
          BlocProvider(create: (_) => SignUpCubit(SignUpUseCase(authRepo))),
        ],
        child: const StoreApp(),
      ),
    ),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: 'Satoshi',
      ),
    );
  }
}
