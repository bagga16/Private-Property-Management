// class UnitModel {
//   final String unitId;
//   final String propertyId;
//   final String unitName;
//   final String unitType;
//   final String rentAmount;
//   final String area;
//   final String description;
//   final String status;
//   final String createdDate;
//   final String updatedDate;
//   final String imagePath;
//   final String? leaseStartDate; // Optional
//   final String? leaseEndDate; // Optional
//   final double? depositAmount; // Optional
//   final String? leaseDocument; // Optional (Stored as Base64)

//   UnitModel({
//     required this.unitId,
//     required this.propertyId,
//     required this.unitName,
//     required this.unitType,
//     required this.rentAmount,
//     required this.area,
//     required this.description,
//     required this.status,
//     required this.createdDate,
//     required this.updatedDate,
//     required this.imagePath,
//     this.leaseStartDate,
//     this.leaseEndDate,
//     this.depositAmount,
//     this.leaseDocument,
//   });

//   factory UnitModel.fromMap(Map<String, dynamic> data, String imagePath) {
//     return UnitModel(
//         unitId: data['unitId'],
//         propertyId: data['propertyId'],
//         unitName: data['unitName'],
//         unitType: data['unitType'],
//         rentAmount: data['rentAmount'],
//         area: data['area'],
//         description: data['description'],
//         status: data['status'],
//         createdDate: data['createdDate'],
//         updatedDate: data['updatedDate'],
//         imagePath: imagePath,
//         leaseDocument: data['leaseDocument'],
//         leaseEndDate: data['leaseEndDate'],
//         leaseStartDate: data['leaseStartDate'],
//         depositAmount: data['depositAmount']);
//   }
// }
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
  final List<String> imageRefs; // Firebase Realtime DB references
  final List<String>? documentRefs; // Firebase Realtime DB references
  final String? leaseStartDate;
  final String? leaseEndDate;
  final String? depositAmount;

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
    required this.imageRefs,
    this.documentRefs,
    this.leaseStartDate,
    this.leaseEndDate,
    this.depositAmount,
  });

  factory UnitModel.fromMap(
    Map<String, dynamic> data,
    List<String> imageRefs,
  ) {
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
      imageRefs: imageRefs,
      documentRefs: List<String>.from(data['documentRefs'] ?? []),
      leaseStartDate: data['leaseStartDate'],
      leaseEndDate: data['leaseEndDate'],
      depositAmount: data['depositAmount'],
    );
  }
}
