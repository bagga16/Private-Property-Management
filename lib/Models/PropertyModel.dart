class PropertyModel {
  final String title;
  final String imagePath;
  final String id;
  final String address;
  final String type;
  final int units;
  final String description;
  final String createdDate;
  final String updatedDate;
  final String status;
  final String? rent;

  PropertyModel(
      {required this.imagePath,
      required this.title,
      required this.id,
      required this.address,
      required this.type,
      required this.units,
      required this.description,
      required this.createdDate,
      required this.updatedDate,
      required this.status,
      this.rent});
}
