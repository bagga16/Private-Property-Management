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

//   // Factory method to create Tenant instance from Firebase data
//   factory Tenant.fromMap(Map<String, dynamic> data) {
//     return Tenant(
//       name: data['name'],
//       status: data['status'],
//       email: data['email'],
//       phone: data['phone'],
//       tenantId: data['tenantId'],
//       unitId: data['unitId'],
//       leaseStart: data['leaseStart'],
//       leaseEnd: data['leaseEnd'],
//       createdDate: data['createdDate'],
//       updatedDate: data['updatedDate'],
//       rent: data['rent'],
//     );
//   }

//   // Convert to Map for sending to Firebase
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'status': status,
//       'email': email,
//       'phone': phone,
//       'tenantId': tenantId,
//       'unitId': unitId,
//       'leaseStart': leaseStart,
//       'leaseEnd': leaseEnd,
//       'createdDate': createdDate,
//       'updatedDate': updatedDate,
//       'rent': rent,
//     };
//   }
// }

class Tenant {
  final String name;
  final String status;
  final String email;
  final String phone;
  final String tenantId; // User input ID, not Firestore generated
  final String unitId;
  final String leaseStart;
  final String leaseEnd;
  final String createdDate;
  final String updatedDate;
  final String rent;

  Tenant({
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
  });

  // Factory method for Firebase
  factory Tenant.fromMap(Map<String, dynamic> data) {
    return Tenant(
      name: data['name'] ?? '',
      status: data['status'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      tenantId: data['tenantId'] ?? '', // User input ID
      unitId: data['unitId'] ?? '',
      leaseStart: data['leaseStart'] ?? '',
      leaseEnd: data['leaseEnd'] ?? '',
      createdDate: data['createdDate'] ?? '',
      updatedDate: data['updatedDate'] ?? '',
      rent: data['rent'] ?? '',
    );
  }
}
