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
  String? imagePath; // Nullable to allow flexibility
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
    this.imagePath,
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
      title: map['title'] ?? 'Untitled',
      id: map['id'] ?? '',
      address: map['address'] ?? 'No Address',
      type: map['type'] ?? 'Unknown',
      units: map['units'] != null ? map['units'] as int : 0,
      description: map['description'] ?? 'No Description',
      createdDate: map['createdDate'] ?? 'N/A',
      updatedDate: map['updatedDate'] ?? 'N/A',
      status: map['status'] ?? 'Unknown',
      rent: map['rent'],
    );
  }
}
