extension InAppNavigatorArgumentExtenstion on Object? {
  T getNavigatorData<T extends Object?>({Object? key, T? defaultValue}) {
    final T? arguments = getNavigatorDataOrNull(
      key: key,
      defaultValue: defaultValue,
    );
    if (arguments != null) {
      return arguments;
    } else {
      throw UnimplementedError("$T didn't sent from another route");
    }
  }

  T? getNavigatorDataOrNull<T extends Object?>({Object? key, T? defaultValue}) {
    var root = this;
    if (root is Map) {
      var arguments = root[key];
      if (arguments is T) {
        return arguments;
      } else {
        return defaultValue;
      }
    } else {
      if (key == null && root is T) {
        return root;
      } else {
        return defaultValue;
      }
    }
  }
}
