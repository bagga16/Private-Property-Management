// class UnitModel {
//   final String name;

//   final String unitId;
//   final String propertyId;
//   final String status;
//   final String rentAmount;
//   final String area;
//   final String description;
//   final String createdDate;
//   final String updatedDate;
//   final String documentId;
//   final String
//       imagePath; // Image URL (first image fetched from Realtime Database)

//   UnitModel({
//     required this.name,
//     required this.unitId,
//     required this.propertyId,
//     required this.status,
//     required this.rentAmount,
//     required this.description,
//     required this.area,
//     required this.documentId,
//     required this.createdDate,
//     required this.updatedDate,
//     required this.imagePath,
//   });
// }

// //   /// Factory method to create `UnitModel` from Firestore Document
// //   factory UnitModel.fromFirestore(DocumentSnapshot doc) {
// //     final data = doc.data() as Map<String, dynamic>;
// //     return UnitModel(
// //       name: data['name'] ?? '',
// //       //  firestoreId: data['firestoreId'] ?? '',
// //       unitId: data['unitId'] ?? '',
// //       //  description: data['description'],
// //       propertyId: data['propertyId'] ?? '',
// //       status: data['status'] ?? '',
// //       documentId: data['documentId'] ?? '',
// //       rentAmount: data['rentAmount'] ?? '',
// //       area: data['area'] ?? '',
// //       createdDate: data['createdDate'] ?? '',
// //       updatedDate: data['updatedDate'] ?? '',
// //       imagePath: '', // Will be fetched separately from Realtime Database
// //     );
// //   }

// //   /// Method to convert `UnitModel` to a Firestore-compatible map
// //   Map<String, dynamic> toFirestore() {
// //     return {
// //       'name': name,
// //       //   'firestoreId': firestoreId,
// //       'unitId': unitId,
// //       'propertyId': propertyId,
// //       //  'description': description,
// //       'status': status,
// //       'documentId': documentId,
// //       'rentAmount': rentAmount,
// //       'area': area,
// //       'createdDate': createdDate,
// //       'updatedDate': updatedDate,
// //     };
// //   }
// // }
class UnitModel {
  final String unitId;
  final String propertyId;
  final String unitName;
  final String unitType;
  final String rentAmount;
  final String area;
  final String description;
  final String status;
  final String createdDate;
  final String updatedDate;
  final String imagePath;

  UnitModel({
    required this.unitId,
    required this.propertyId,
    required this.unitName,
    required this.unitType,
    required this.rentAmount,
    required this.area,
    required this.description,
    required this.status,
    required this.createdDate,
    required this.updatedDate,
    required this.imagePath,
  });

  factory UnitModel.fromMap(Map<String, dynamic> data, String imagePath) {
    return UnitModel(
      unitId: data['unitId'],
      propertyId: data['propertyId'],
      unitName: data['unitName'],
      unitType: data['unitType'],
      rentAmount: data['rentAmount'],
      area: data['area'],
      description: data['description'],
      status: data['status'],
      createdDate: data['createdDate'],
      updatedDate: data['updatedDate'],
      imagePath: imagePath,
    );
  }
}
