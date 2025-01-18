// class Tenant {
//   final String name;
//   final String status;
//   final String email;
//   final String phone;
//   final String tenantId;
//   final String unitId;
//   final String leaseStart;
//   final String leaseEnd;
//   final String createdDate;
//   final String updatedDate;
//   final String rent;

//   Tenant({
//     required this.name,
//     required this.status,
//     required this.email,
//     required this.phone,
//     required this.tenantId,
//     required this.unitId,
//     required this.leaseStart,
//     required this.leaseEnd,
//     required this.createdDate,
//     required this.updatedDate,
//     required this.rent,
//   });

//   // Factory method for Firebase
//   factory Tenant.fromMap(Map<String, dynamic> data) {
//     return Tenant(
//       name: data['name'] ?? '',
//       status: data['status'] ?? '',
//       email: data['email'] ?? '',
//       phone: data['phone'] ?? '',
//       tenantId: data['tenantId'] ?? '', // User input ID
//       unitId: data['unitId'] ?? '',
//       leaseStart: data['leaseStart'] ?? '',
//       leaseEnd: data['leaseEnd'] ?? '',
//       createdDate: data['createdDate'] ?? '',
//       updatedDate: data['updatedDate'] ?? '',
//       rent: data['rent'] ?? '',
//     );
//   }

//   get id => null;
// }
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
  final String rent;
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
    required this.rent,
    this.securityDeposit,
    this.paymentStatus,
  });

  /// Factory method to create a Tenant object from a Firestore document
  factory Tenant.fromMap(Map<String, dynamic> map, String id) {
    return Tenant(
      id: id,
      name: map['name'] ?? 'N/A',
      status: map['status'] ?? 'N/A',
      email: map['email'] ?? 'N/A',
      phone: map['phone'] ?? 'N/A',
      tenantId: map['tenantId'] ?? 'N/A',
      unitId: map['unitId'] ?? 'N/A',
      leaseStart: map['leaseStart'] ?? 'N/A',
      leaseEnd: map['leaseEnd'] ?? 'N/A',
      createdDate: map['createdDate'] ?? 'N/A',
      updatedDate: map['updatedDate'] ?? 'N/A',
      rent: map['rent'] ?? 'N/A',
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
      'rent': rent,
      'securityDeposit': securityDeposit,
      'paymentStatus': paymentStatus
    };
  }
}
