class Tenant {
  final String id;
  final String name;
  final String status;
  final String email;
  final String phone;
  final String tenantId;
  final String unitId;
  final String leaseStart;
  final String leaseEnd;
  final String createdDate;
  final String updatedDate;
  final String rentAmount;
  final String? securityDeposit;
  final String? paymentStatus;

  Tenant({
    required this.id,
    required this.name,
    required this.status,
    required this.email,
    required this.phone,
    required this.tenantId,
    required this.unitId,
    required this.leaseStart,
    required this.leaseEnd,
    required this.createdDate,
    required this.updatedDate,
    required this.rentAmount,
    this.securityDeposit,
    this.paymentStatus,
  });

  /// Factory method to create a Tenant object from a Firestore document
  factory Tenant.fromMap(Map<String, dynamic> map, String id) {
    return Tenant(
      id: id,
      name: map['name'] ?? 'N/A',
      status: map['status'] ?? 'In-Active',
      email: map['email'] ?? 'N/A',
      phone: map['phone'] ?? 'N/A',
      tenantId: map['tenantId'] ?? 'N/A',
      unitId: map['unitId'] ?? 'N/A',
      leaseStart: map['leaseStart'] ?? 'N/A',
      leaseEnd: map['leaseEnd'] ?? 'N/A',
      createdDate: map['createdDate'] ?? 'N/A',
      updatedDate: map['updatedDate'] ?? 'N/A',
      rentAmount: map['rentAmount'] ?? '0',
      securityDeposit: map['securityDeposit'] ?? 'N/A',
      paymentStatus: map['paymentStatus'] ?? 'N/A',
    );
  }

  /// Convert the Tenant object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'email': email,
      'phone': phone,
      'tenantId': tenantId,
      'unitId': unitId,
      'leaseStart': leaseStart,
      'leaseEnd': leaseEnd,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'rentAmount': rentAmount,
      'securityDeposit': securityDeposit,
      'paymentStatus': paymentStatus
    };
  }
}
