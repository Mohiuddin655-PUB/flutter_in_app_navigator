import 'package:flutter/material.dart';

import 'flags.dart';

abstract class InAppNavigatorDelegate {
  final String defaultRoute;

  const InAppNavigatorDelegate({
    required this.defaultRoute,
  });

  Object? get arguments => null;

  bool isVisited(String name);

  bool setVisitor(String name);

  void clear<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  });

  void close<T extends Object?>(
    BuildContext context, {
    T? result,
    Map<String, dynamic>? routeConfigs,
  });

  void home<T extends Object?>(
    BuildContext context, {
    Object? arguments,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return next(
      context,
      defaultRoute,
      arguments: arguments,
      clearMode: true,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  void next<T extends Object?>(
    BuildContext context,
    String defaultRoute, {
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
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
    if (clearMode) {
      clear(
        context,
        route,
        predicate: predicate,
        arguments: arguments,
        routeConfigs: routeConfigs,
      );
    } else {
      open(
        context,
        route,
        arguments: arguments,
        routeConfigs: routeConfigs,
      );
    }
  }

  void neglect(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    Router.neglect(context, () {
      clear(
        context,
        route,
        predicate: predicate,
        arguments: arguments,
        routeConfigs: routeConfigs,
      );
    });
  }

  Future<T?>? navigate<T extends Object?>(
    BuildContext context,
    String route, {
    Object? arguments,
    Object? result,
    Flag? flag,
    bool Function(Route<dynamic>)? predicate,
    Map<String, dynamic>? routeConfigs,
  }) {
    switch (flag) {
      case Flag.clear:
        clear(
          context,
          route,
          arguments: arguments,
          predicate: predicate,
          routeConfigs: routeConfigs,
        );
        return Future.value(null);
      case Flag.neglect:
        neglect(
          context,
          route,
          arguments: arguments,
          predicate: predicate,
          routeConfigs: routeConfigs,
        );
        return Future.value(null);
      case Flag.replace:
        return replace(
          context,
          route,
          arguments: arguments,
          result: result,
          routeConfigs: routeConfigs,
        );
      default:
        return open(
          context,
          route,
          arguments: arguments,
          routeConfigs: routeConfigs,
        );
    }
  }

  Future<T?>? open<T extends Object?>(
    BuildContext context,
    String route, {
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  });

  Future<T?>? replace<T extends Object?, TO extends Object?>(
    BuildContext context,
    String route, {
    TO? result,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  });
}
