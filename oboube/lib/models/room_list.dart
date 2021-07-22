class RoomName {
  final String id;
  final String room;
  final bool isFree;
  final String name;
  final String nationality;
  final String numberOfDay;

  RoomName({
    this.id = '',
    this.room = '',
    this.isFree = true,
    required this.name,
    required this.nationality,
    required this.numberOfDay,
  });
}
