// class MaintenanceRequestModel {
//   final String id; // Document ID
//   final String tenantId;
//   final String unitId;
//   final String requestedDate;
//   final String priority;
//   final String status;
//   final String resolvedDate;
//   final String description;
//   final String? assignedTo;
//   final String? imageUrl;

//   MaintenanceRequestModel({
//     required this.description,
//     required this.id,
//     required this.tenantId,
//     required this.unitId,
//     required this.requestedDate,
//     required this.priority,
//     required this.status,
//     required this.resolvedDate,
//     this.assignedTo,
//     this.imageUrl,
//   });

//   // Factory to convert Firestore document to model
//   factory MaintenanceRequestModel.fromFirestore(Map<String, dynamic> data) {
//     return MaintenanceRequestModel(
//       id: '', // Initialize as empty, will be set later with doc.id
//       tenantId: data['tenantId'] ?? '',
//       unitId: data['unitId'] ?? '',
//       requestedDate: data['requestedDate'] ?? '',
//       priority: data['priority'] ?? '',
//       status: data['status'] ?? '',
//       description: data['description'] ?? 'No Description available',
//       resolvedDate: data['resolvedDate'] ?? '',
//       assignedTo: data['assignedTo'],
//       imageUrl: data['imageUrl'],
//     );
//   }

//   // Convert model to Firestore-compatible map
//   Map<String, dynamic> toFirestore() {
//     return {
//       'tenantId': tenantId,
//       'unitId': unitId,
//       'requestedDate': requestedDate,
//       'priority': priority,
//       'status': status,
//       'resolvedDate': resolvedDate,
//       'description': description,
//       'assignedTo': assignedTo,
//       'imageUrl': imageUrl,
//     };
//   }

//   // Add a copyWith method for easy updates
//   MaintenanceRequestModel copyWith({
//     String? id,
//     String? tenantId,
//     String? unitId,
//     String? requestedDate,
//     String? priority,
//     String? status,
//     String? description,
//     String? resolvedDate,
//     String? assignedTo,
//     String? imageUrl,
//   }) {
//     return MaintenanceRequestModel(
//       id: id ?? this.id,
//       tenantId: tenantId ?? this.tenantId,
//       unitId: unitId ?? this.unitId,
//       requestedDate: requestedDate ?? this.requestedDate,
//       priority: priority ?? this.priority,
//       status: status ?? this.status,
//       description: description ?? this.description,
//       resolvedDate: resolvedDate ?? this.resolvedDate,
//       assignedTo: assignedTo ?? this.assignedTo,
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }
// }

class MaintenanceRequestModel {
  final String id; // Document ID
  final String tenantId;
  final String unitId;
  final String requestedDate;
  final String priority;
  final String status;
  final String resolvedDate;
  final String description;
  final String? assignedTo;
  final String? imageUrl;
  final String updatedDate; // ✅ Added updatedDate field

  MaintenanceRequestModel({
    required this.description,
    required this.id,
    required this.tenantId,
    required this.unitId,
    required this.requestedDate,
    required this.priority,
    required this.status,
    required this.resolvedDate,
    required this.updatedDate, // ✅ Initialize updatedDate
    this.assignedTo,
    this.imageUrl,
  });

  // Factory to convert Firestore document to model
  factory MaintenanceRequestModel.fromFirestore(Map<String, dynamic> data) {
    return MaintenanceRequestModel(
      id: '', // Initialize as empty, will be set later with doc.id
      tenantId: data['tenantId'] ?? '',
      unitId: data['unitId'] ?? '',
      requestedDate: data['requestedDate'] ?? '',
      priority: data['priority'] ?? '',
      status: data['status'] ?? '',
      description: data['description'] ?? 'No Description available',
      resolvedDate: data['resolvedDate'] ?? '',
      updatedDate:
          data['updatedDate'] ?? '', // ✅ Get updatedDate from Firestore
      assignedTo: data['assignedTo'],
      imageUrl: data['imageUrl'],
    );
  }

  // Convert model to Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'tenantId': tenantId,
      'unitId': unitId,
      'requestedDate': requestedDate,
      'priority': priority,
      'status': status,
      'resolvedDate': resolvedDate,
      'updatedDate': updatedDate, // ✅ Store updatedDate
      'description': description,
      'assignedTo': assignedTo,
      'imageUrl': imageUrl,
    };
  }

  // Add a copyWith method for easy updates
  MaintenanceRequestModel copyWith({
    String? id,
    String? tenantId,
    String? unitId,
    String? requestedDate,
    String? priority,
    String? status,
    String? description,
    String? resolvedDate,
    String? updatedDate, // ✅ Added updatedDate in copyWith
    String? assignedTo,
    String? imageUrl,
  }) {
    return MaintenanceRequestModel(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      unitId: unitId ?? this.unitId,
      requestedDate: requestedDate ?? this.requestedDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      description: description ?? this.description,
      resolvedDate: resolvedDate ?? this.resolvedDate,
      updatedDate: updatedDate ?? this.updatedDate, // ✅ Keep updatedDate
      assignedTo: assignedTo ?? this.assignedTo,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
