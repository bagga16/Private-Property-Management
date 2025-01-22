class MaintenanceRequestModel {
  final String id; // Document ID
  final String tenantId;
  final String unitId;
  final String requestedDate;
  final String priority;
  final String status;
  final String resolvedDate;
  final String? assignedTo;

  MaintenanceRequestModel({
    required this.id,
    required this.tenantId,
    required this.unitId,
    required this.requestedDate,
    required this.priority,
    required this.status,
    required this.resolvedDate,
    this.assignedTo,
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
      resolvedDate: data['resolvedDate'] ?? '',
      assignedTo: data['assignedTo'],
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
      'assignedTo': assignedTo,
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
    String? resolvedDate,
    String? assignedTo,
  }) {
    return MaintenanceRequestModel(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      unitId: unitId ?? this.unitId,
      requestedDate: requestedDate ?? this.requestedDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      resolvedDate: resolvedDate ?? this.resolvedDate,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }
}
