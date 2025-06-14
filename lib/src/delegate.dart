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

  Future<List<String>> routes({String? groupName, Object? args}) async => [];

  Future<T?>? clear<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  });

  Future<T?>? close<T extends Object?>(
    BuildContext context, {
    T? result,
    Map<String, dynamic>? routeConfigs,
  });

  Future<T?>? home<T extends Object?>(
    BuildContext context, {
    Object? arguments,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return visit(
      context,
      defaultRoute,
      arguments: arguments,
      clearMode: true,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? next<T extends Object?>(
    BuildContext context,
    String currentRoute, {
    String? groupName,
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
    Map<String, dynamic>? routeConfigs,
  }) async {
    final routes = await this.routes(groupName: groupName, args: arguments);
    if (routes.isEmpty || !context.mounted) return null;
    final index = routes.indexOf(currentRoute);
    final route = routes.elementAtOrNull(index + 1);
    if (route == null) return null;
    if (clearMode) {
      return clear(
        context,
        route,
        predicate: predicate,
        arguments: arguments,
        routeConfigs: routeConfigs,
      );
    }
    return open(
      context,
      route,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? visit<T extends Object?>(
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
      return clear(
        context,
        route,
        predicate: predicate,
        arguments: arguments,
        routeConfigs: routeConfigs,
      );
    }
    return open(
      context,
      route,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? neglect<T extends Object?>(
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
    return null;
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
        return clear(
          context,
          route,
          arguments: arguments,
          predicate: predicate,
          routeConfigs: routeConfigs,
        );
      case Flag.neglect:
        return neglect(
          context,
          route,
          arguments: arguments,
          predicate: predicate,
          routeConfigs: routeConfigs,
        );
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
