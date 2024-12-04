import 'package:cosmetic_shop/src/presentation/ui/pages/catalog_search_screen.dart';
import 'package:cosmetic_shop/src/presentation/ui/pages/home_screen.dart';
import 'package:cosmetic_shop/service/navigation/go_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final statsAppRouter = AppRoutes();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: statsAppRouter.router.routeInformationParser,
      routeInformationProvider: statsAppRouter.router.routeInformationProvider,
      routerDelegate: statsAppRouter.router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
