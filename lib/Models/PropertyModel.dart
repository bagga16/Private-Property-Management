class PropertyModel {
  final String title;
  final String id;
  final String address;
  final String type;
  final int units;
  final String description;
  final String createdDate;
  final String updatedDate;
  final String status;
  late final String imagePath;
  final String? rent;

  PropertyModel({
    required this.title,
    required this.id,
    required this.address,
    required this.type,
    required this.units,
    required this.description,
    required this.createdDate,
    required this.updatedDate,
    required this.status,
    required this.imagePath,
    this.rent,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'address': address,
      'type': type,
      'units': units,
      'description': description,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'status': status,
      'imagePath': imagePath,
      'rent': rent,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      title: map['title'],
      id: map['id'],
      address: map['address'],
      type: map['type'],
      units: map['units'],
      description: map['description'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      status: map['status'],
      imagePath: map['imagePath'],
      rent: map['rent'],
    );
  }
}
