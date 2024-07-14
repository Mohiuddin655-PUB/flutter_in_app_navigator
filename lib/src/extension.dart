import 'package:flutter/material.dart';

import 'flags.dart';
import 'router.dart';

extension InAppNavigatorHelper on BuildContext {
  void clear<T extends Object?>(
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.clear(
      this,
      route,
      predicate: predicate,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  void close<T extends Object?>({
    T? result,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.close(
      this,
      result: result,
      routeConfigs: routeConfigs,
    );
  }

  void home<T extends Object?>({
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.home(
      this,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  void neglect(
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.neglect(
      this,
      route,
      predicate: predicate,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? navigate<T extends Object?>(
    String route, {
    Object? arguments,
    Object? result,
    Flag? flag,
    bool Function(Route<dynamic>)? predicate,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.navigate(
      this,
      route,
      arguments: arguments,
      result: result,
      flag: flag,
      predicate: predicate,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? open<T extends Object?>(
    String route, {
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.open(
      this,
      route,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? replace<T extends Object?, TO extends Object?>(
    String route, {
    TO? result,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.replace(
      this,
      route,
      result: result,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }
}
