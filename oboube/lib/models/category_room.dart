class RoomData {
  final String id;
  final String title;
  final String imageUrl;
  final int journalier;
  final int mensuel;
  final String chambre;

  const RoomData({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.journalier,
    required this.mensuel,
    required this.chambre,
  });
}
