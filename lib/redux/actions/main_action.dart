abstract class ActionType<T> {
  final T payload;

  ActionType({this.payload});

  @override
  String toString() {
    return '$runtimeType(${payload?.runtimeType})';
  }
}

class VoidAction extends ActionType<void> {}
