import 'package:flutter/material.dart';

enum Flag {
  none,
  clear,
  replacement,
}

abstract class InAppNavigatorDelegate {
  final String defaultRoute;

  const InAppNavigatorDelegate({
    required this.defaultRoute,
  });

  Object? get arguments => null;

  bool isVisited(String name);

  bool setVisitor(String name);

  void close<T extends Object?>(
    BuildContext context, {
    T? result,
    Map<String, dynamic>? routeConfigs,
  });

  void home<T extends Object?>(
    BuildContext context, {
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    String route = defaultRoute;
    for (var i in routes) {
      if (!isVisited(i)) {
        route = i;
        break;
      }
    }
    replace(context, route);
  }

  void neglect(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? data,
    Map<String, dynamic>? routeConfigs,
  }) {
    Router.neglect(context, () {
      replace(
        context,
        route,
        predicate: predicate,
        data: data,
        routeConfigs: routeConfigs,
      );
    });
  }

  Future<T?>? navigate<T extends Object?>(
    BuildContext context,
    String route, {
    Object? data,
    Flag? flag,
    Map<String, dynamic>? routeConfigs,
  }) {
    switch (flag) {
      case Flag.clear:
        neglect(context, route, data: data, routeConfigs: routeConfigs);
        return Future.value(null);
      case Flag.replacement:
        return replace(context, route, data: data, routeConfigs: routeConfigs);
      default:
        return open(context, route, data: data, routeConfigs: routeConfigs);
    }
  }

  Future<T?>? open<T extends Object?>(
    BuildContext context,
    String route, {
    Object? data,
    Map<String, dynamic>? routeConfigs,
  });

  Future<T?>? replace<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? data,
    Map<String, dynamic>? routeConfigs,
  });
}
