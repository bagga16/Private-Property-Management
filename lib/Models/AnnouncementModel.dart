class AnnouncementModel {
  final String id;
  final String propertyName;
  final String description;
  final String date;

  AnnouncementModel({
    required this.id,
    required this.propertyName,
    required this.description,
    required this.date,
  });

  factory AnnouncementModel.fromMap(String id, Map<String, dynamic> map) {
    return AnnouncementModel(
      id: id,
      propertyName: map['propertyName'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
