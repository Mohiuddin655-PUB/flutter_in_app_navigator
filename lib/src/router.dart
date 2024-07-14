import 'package:flutter/material.dart';

import '../in_app_navigator.dart';

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

  static Object? _args;

  static Object? get arguments => _args ?? _i?.delegate.arguments;

  static T getData<T extends Object?>([Object? key]) => arguments.get(key);

  static T? getDataOrNull<T extends Object?>([Object? key]) {
    return arguments.getOrNull(key);
  }

  static bool isVisited(String name) => i.delegate.isVisited(name);

  static bool isNotVisited(String name) => !isVisited(name);

  static void setArguments(Object? args) => _args = args;

  static bool setVisitor(String name) => i.delegate.setVisitor(name);

  static void close<T extends Object?>(
    BuildContext context, {
    T? result,
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.close(
      context,
      result: result,
      routeConfigs: routeConfigs,
    );
  }

  static void home<T extends Object?>(
    BuildContext context, {
    List<String> routes = const [],
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.home(
      context,
      routes: routes,
      routeConfigs: routeConfigs,
    );
  }

  static void neglect(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? data,
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.neglect(
      context,
      route,
      predicate: predicate,
      data: data,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? navigate<T extends Object?>(
    BuildContext context,
    String route, {
    Object? data,
    Flag? flag,
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.navigate(
      context,
      route,
      data: data,
      flag: flag,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? open<T extends Object?>(
    BuildContext context,
    String route, {
    Object? data,
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.open(
      context,
      route,
      data: data,
      routeConfigs: routeConfigs,
    );
  }

  static Future<T?>? replace<T extends Object?>(
    BuildContext context,
    String route, {
    RoutePredicate? predicate,
    Object? data,
    Map<String, dynamic>? routeConfigs,
  }) {
    return _i?.delegate.replace(
      context,
      route,
      predicate: predicate,
      data: data,
      routeConfigs: routeConfigs,
    );
  }
}

extension InAppNavigatorArgumentExtenstion on Object? {
  T get<T extends Object?>([Object? key, T? secondary]) {
    final T? data = getOrNull(key, secondary);
    if (data != null) {
      return data;
    } else {
      throw UnimplementedError("$T didn't sent from another route");
    }
  }

  T? getOrNull<T extends Object?>([Object? key, T? secondary]) {
    var root = this;
    if (root is Map) {
      var data = root[key];
      if (data is T) {
        return data;
      } else {
        return secondary;
      }
    } else {
      if (root is T) {
        return root;
      } else {
        return secondary;
      }
    }
  }
}
