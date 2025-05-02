abstract class TabEvent {}

class TabChanged extends TabEvent {
  final int index;

  TabChanged(this.index);
}
