import 'package:flutter/material.dart';

import 'delegate.dart';
import 'finder.dart';
import 'flags.dart';

class InAppNavigator {
  final InAppNavigatorDelegate delegate;

  const InAppNavigator._(this.delegate);

  static InAppNavigator? _i;

  static InAppNavigator get i {
    if (_i != null) {
      return _i!;
    } else {
      throw UnimplementedError("$InAppNavigator not initialized yet!");
    }
  }

  static InAppNavigator init({
    required InAppNavigatorDelegate delegate,
  }) {
    _i = InAppNavigator._(delegate);
    return i;
  }

  static Object? get arguments => i.delegate.arguments;

  static T getData<T extends Object?>({
    Object? key,
    T? defaultValue,
  }) {
    return arguments.getNavigatorData(key: key, defaultValue: defaultValue);
  }

  static T? getDataOrNull<T extends Object?>({
    Object? key,
    T? defaultValue,
  }) {
    return arguments.getNavigatorDataOrNull(
      key: key,
      defaultValue: defaultValue,
    );
  }

  static bool isVisited(String name) => i.delegate.isVisited(name);

  static bool isNotVisited(String name) => !isVisited(name);

  static bool setVisitor(String name) => i.delegate.setVisitor(name);

  static Future<T?>? clear<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.clear(
      context,
      route,
      predicate: predicate,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? close<T extends Object?>(
    BuildContext context, {
    T? result,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.close(
      context,
      result: result,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? home<T extends Object?>(
    BuildContext context, {
    Object? arguments,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.home(
      context,
      routes: routes,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? next<T extends Object?>(
    BuildContext context,
    String currentRoute, {
    String? groupName,
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.next(
      context,
      currentRoute,
      groupName: groupName,
      arguments: arguments,
      predicate: predicate,
      clearMode: clearMode,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? visit<T extends Object?>(
    BuildContext context,
    String defaultRoute, {
    Object? arguments,
    RoutePredicate? predicate,
    bool clearMode = false,
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.visit(
      context,
      defaultRoute,
      arguments: arguments,
      predicate: predicate,
      clearMode: clearMode,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? neglect<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.neglect(
      context,
      route,
      predicate: predicate,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? navigate<T extends Object?>(
    BuildContext context,
    String route, {
    Object? arguments,
    Object? result,
    Flag? flag,
    bool Function(Route<dynamic>)? predicate,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.navigate(
      context,
      route,
      arguments: arguments,
      result: result,
      flag: flag,
      predicate: predicate,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? open<T extends Object?>(
    BuildContext context,
    String route, {
    Object? arguments,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.open(
      context,
      route,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? replace<T extends Object?, TO extends Object?>(
    BuildContext context,
    String route, {
    Object? arguments,
    TO? result,
    Map<String, dynamic>? routeConfigs,
  }) {
    return i.delegate.replace(
      context,
      route,
      arguments: arguments,
      routeConfigs: routeConfigs,
    );
  }
}
