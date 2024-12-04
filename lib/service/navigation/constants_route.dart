import 'package:go_router/go_router.dart';

typedef RouteRecord = ({String name, String path, String fullPath});

class Routes {
  static const RouteRecord home = (
  name: 'home',
  path: '/home',
  fullPath: '/home',
  );
  static const RouteRecord catalog = (
  name: 'catalog',
  path: '/catalog',
  fullPath: '/catalog',
  );
  static const RouteRecord types = (
  name: 'types',
  path: '/types',
  fullPath: '/catalog/types',
  );
  static const RouteRecord shoptype = (
  name: 'shoptype',
  path: '/shoptype',
  fullPath: '/catalog/shoptype',
  );
  static const RouteRecord filter = (
  name: 'filter',
  path: '/filter',
  fullPath: '/catalog/filter',
  );
  static const RouteRecord cart = (
  name: 'cart',
  path: '/cart',
  fullPath: '/cart',
  );
  static const RouteRecord profile = (
  name: 'profile',
  path: '/profile',
  fullPath: '/profile',
  );
}

extension AppRouteMapper on RouteRecord {
  GoRoute toRoute() {
    return GoRoute(
      path: path,
      name: name,
    );
  }
}
