import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_router.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
