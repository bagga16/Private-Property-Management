import 'package:get/get.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class WorkerDetailsController extends GetxController {
  // Observable list for assigned properties
  RxList<PropertyModel> assignedProperties = <PropertyModel>[].obs;

  // Map properties from worker's data to PropertyModel
  void loadWorkerProperties(List<Map<String, dynamic>> properties) {
    assignedProperties.value = properties.map((property) {
      return PropertyModel(
        id: property['propertyId'] ?? '',
        title: property['propertyName'] ?? '',
        address: property['address'] ?? 'N/A',
        type: property['type'] ?? 'N/A',
        units: int.tryParse(property['units']?.toString() ?? '0') ?? 0,
        description: property['description'] ?? '',
        createdDate: property['createdDate'] ?? '',
        updatedDate: property['updatedDate'] ?? '',
        status: property['status'] ?? 'Inactive',
        city: '',
        country: '',
        state: '',
        zip: '',
      );
    }).toList();
  }
}
