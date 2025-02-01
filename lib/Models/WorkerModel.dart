class WorkerModel {
  final String id;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String createdDate;
  final String updatedDate;
  final List<Map<String, dynamic>> properties; // Accept dynamic types

  WorkerModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.createdDate,
    required this.updatedDate,
    required this.properties,
  });

  factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      id: map['workerId']?.toString() ?? '',
      name: "${map['firstName'] ?? ''} ${map['lastName'] ?? ''}".trim(),
      role: map['role'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      createdDate: map['createdDate'] ?? '',
      updatedDate: map['updatedDate'] ?? '',
      properties: List<Map<String, dynamic>>.from(map['properties'] ?? []),
    );
  }
}
