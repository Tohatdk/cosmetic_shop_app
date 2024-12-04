import 'package:cosmetic_shop/bottom_navigator_bar_custom.dart';
import 'package:cosmetic_shop/src/presentation/ui/pages/catalog_search_screen.dart';
import 'package:cosmetic_shop/src/presentation/ui/pages/catalog_shop_screen.dart';
import 'package:cosmetic_shop/src/presentation/ui/components/filter_shop_component.dart';
import 'package:cosmetic_shop/src/presentation/ui/pages/home_screen.dart';
import 'package:cosmetic_shop/service/navigation/constants_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
final _shellNavKey = GlobalKey<NavigatorState>();

class AppRoutes {
  final GoRouter _goRoute = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: '/home',
    redirectLimit: 1,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigatorBarCustom(child: child);
        },
        routes: [
          GoRoute(
              path: Routes.home.path,
              name: Routes.home.name,
            //   parentNavigatorKey: _shellNavKey,
              // pageBuilder: (context, state) {
              //   return NoTransitionPage(
              //     key: state.pageKey,
            builder: (context, goState) => const HomeScreen(),
              //   );
              // }),
          ),
          GoRoute(
              path: Routes.catalog.path,
              name: Routes.catalog.name,
             //  parentNavigatorKey: _shellNavKey,
              // pageBuilder: (context, state) {
              //   return NoTransitionPage(
              //     key: state.pageKey,
              builder: (context, goState) =>  const CatalogSearchScreen(),
               // );
            //  },
              routes: [
                GoRoute(
                  path: Routes.types.path,
                  name: Routes.types.name,
                  builder: (context, goState) => const TypeSelectionScreen(),
                ),
                GoRoute(
                  path: Routes.shoptype.path,
                  name: Routes.shoptype.name,
                  builder: (context, goState) => const CatalogShopScreen(),
                ),
                GoRoute(
                  path: Routes.filter.path,
                  name: Routes.filter.name,
                  builder: (context, goState) => FilterShopComponent(),
                ),
              ]),
          GoRoute(
            path: Routes.cart.path,
            name: Routes.cart.name,

            builder: (context, state) => const Center(child: Text('Корзина')),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            builder: (context, state) => const Center(child: Text('Профиль')),
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _goRoute;
}
