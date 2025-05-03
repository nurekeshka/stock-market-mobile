class TabChange extends TabEvent {
  final int index;

  TabChange(this.index);
}

abstract class TabEvent {}
