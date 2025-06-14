import 'package:flutter/material.dart';

import 'flags.dart';
import 'router.dart';

extension InAppNavigatorHelper on BuildContext {
  Future<T?>? clear<T extends Object?>(
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

  Future<T?>? close<T extends Object?>({
    T? result,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.close(
      this,
      result: result,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? home<T extends Object?>({
    Object? arguments,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.home(
      this,
      arguments: arguments,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? next<T extends Object?>(
    String currentRoute, {
    String? groupName,
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.next(
      this,
      currentRoute,
      groupName: groupName,
      arguments: arguments,
      predicate: predicate,
      clearMode: clearMode,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? visit<T extends Object?>(
    String defaultRoute, {
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return InAppNavigator.visit(
      this,
      defaultRoute,
      arguments: arguments,
      predicate: predicate,
      clearMode: clearMode,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  Future<T?>? neglect<T extends Object?>(
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
