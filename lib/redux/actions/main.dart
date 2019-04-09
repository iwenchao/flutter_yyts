abstract class ActionType<T> {
  final T payload;

  ActionType({this.payload});

  @override
  String toString() {
    // TODO: implement toString
    return '$runtimeType(${payload?.runtimeType})';
  }
}

class VoidAction extends ActionType<void> {}
