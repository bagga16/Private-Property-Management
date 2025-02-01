// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:intl/intl.dart';

// class AddTenantController extends GetxController {
//   final tenantIdController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final leaseStartController = TextEditingController();
//   final leaseEndController = TextEditingController();
//   final rentController = TextEditingController();
//   final unitIdController = TextEditingController();
//   final securityDepositController = TextEditingController();

//   // Dropdown selections
//   final RxString selectedStatus = ''.obs;
//   final RxString paymentStatus = ''.obs;
//   // Tracks submission status
//   final RxBool isSubmitting = false.obs;

//   // Selected file

//   final RxList<File> selectedFiles = RxList<File>();
//   // final Rx<File?> selectedFile = Rx<File?>(null);
//   final database = FirebaseDatabase.instance;
//   final firestore = FirebaseFirestore.instance;

//   /// Select multiple files (PDFs)
//   Future<void> pickFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//         allowMultiple: true, // Allow multiple files
//       );

//       if (result != null) {
//         selectedFiles.addAll(result.paths.map((path) => File(path!)));
//         Get.snackbar(
//             'Files Selected', '${selectedFiles.length} file(s) selected.');
//       } else {
//         Get.snackbar(
//             'No Files Selected', 'Please select at least one lease document.');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to select files: $e');
//     }
//   }

//   Future<void> pickLeaseDate(
//       BuildContext context, TextEditingController controller) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       controller.text =
//           DateFormat('dd/MM/yyyy').format(pickedDate); // Format the picked date
//     } else {
//       Get.snackbar('Cancelled', 'No date selected');
//     }
//   }

//   Future<void> addTenant() async {
//     if (!_validateInputs()) {
//       Get.snackbar('Error', 'Please fill all required fields.');
//       return;
//     }

//     try {
//       isSubmitting.value = true;

//       // Prepare tenant data
//       final leaseStartFormatted = _formatDate(leaseStartController.text);
//       final leaseEndFormatted = _formatDate(leaseEndController.text);

//       final tenantData = {
//         'tenantId': tenantIdController.text,
//         'name': '${firstNameController.text} ${lastNameController.text}',
//         'email': emailController.text,
//         'phone': phoneController.text,
//         'leaseStart': leaseStartFormatted,
//         'leaseEnd': leaseEndFormatted,
//         'rent': rentController.text,
//         'unitId': unitIdController.text,
//         'status': selectedStatus.value,
//         'paymentStatus': paymentStatus.value,
//         'securityDeposit': securityDepositController.text,
//         'createdDate': DateTime.now().toIso8601String(),
//         'updatedDate': DateTime.now().toIso8601String(),
//       };

//       // Add tenant data to Firestore and get the document ID
//       DocumentReference tenantDocRef =
//           await firestore.collection('All Tenants').add(tenantData);

//       // Upload lease documents to Realtime Database under the correct tenant ID
//       final leaseDocsRef = database.ref(
//           'tenants/${tenantDocRef.id}/lease_documents'); // Use Firestore doc ID

//       for (var file in selectedFiles) {
//         final uniqueKey =
//             leaseDocsRef.push().key; // Generate unique key for each file
//         if (uniqueKey != null) {
//           final fileName = file.path.split('/').last;
//           await leaseDocsRef.child(uniqueKey).set({
//             "fileName": fileName,
//             "fileData": file.readAsBytesSync().toList(),
//             "uploadDate": DateTime.now().toIso8601String(),
//           });
//         }
//       }

//       Get.snackbar('Success', 'Tenant added successfully.');
//       clearForm();
//       Get.offAllNamed('/tenant-screen');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add tenant: $e');
//     } finally {
//       isSubmitting.value = false; // Stop the loading indicator
//     }
//   }

// // Validate inputs
//   bool _validateInputs() {
//     return tenantIdController.text.isNotEmpty &&
//         firstNameController.text.isNotEmpty &&
//         emailController.text.isNotEmpty &&
//         phoneController.text.isNotEmpty &&
//         leaseStartController.text.isNotEmpty &&
//         leaseEndController.text.isNotEmpty &&
//         rentController.text.isNotEmpty &&
//         unitIdController.text.isNotEmpty;
//   }

//   /// Clear all input fields
//   void clearForm() {
//     tenantIdController.clear();
//     firstNameController.clear();
//     lastNameController.clear();
//     emailController.clear();
//     phoneController.clear();
//     leaseStartController.clear();
//     leaseEndController.clear();
//     rentController.clear();
//     unitIdController.clear();
//     securityDepositController.clear();
//     selectedStatus.value = '';
//     paymentStatus.value = '';
//     selectedFiles.clear();
//   }

//   String _formatDate(String date) {
//     try {
//       final parsedDate = DateFormat('dd/MM/yyyy').parse(date);
//       return DateFormat('dd/MM/yyyy').format(parsedDate);
//     } catch (e) {
//       throw FormatException("Invalid date format: $date");
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddTenantController extends GetxController {
//   final tenantIdController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final rentController = TextEditingController();
//   final unitIdController = TextEditingController();
//   final passwordController = TextEditingController(); // ✅ Added Password Field

//   // Dropdown selections
//   final RxString selectedStatus = ''.obs;
//   final RxString paymentStatus = ''.obs;
//   final RxBool isSubmitting = false.obs; // Submission status

//   final firestore = FirebaseFirestore.instance;

//   /// **Add Tenant to Firestore**
//   Future<void> addTenant() async {
//     if (!_validateInputs()) {
//       Get.snackbar('Error', 'Please fill all required fields.');
//       return;
//     }

//     try {
//       isSubmitting.value = true;

//       final tenantData = {
//         'tenantId': tenantIdController.text,
//         'name': '${firstNameController.text} ${lastNameController.text}',
//         'email': emailController.text,
//         'phone': phoneController.text,
//         'rent': rentController.text,
//         'unitId': unitIdController.text,
//         'status': selectedStatus.value,
//         'paymentStatus': paymentStatus.value,
//         'password': passwordController.text, // ✅ Storing Password
//         'createdDate': DateTime.now().toIso8601String(),
//         'updatedDate': DateTime.now().toIso8601String(),
//       };

//       await firestore.collection('All Users').add(tenantData);

//       Get.snackbar('Success', 'Tenant added successfully.');
//       clearForm();
//       Get.offAllNamed('/tenant-screen');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add tenant: $e');
//     } finally {
//       isSubmitting.value = false;
//     }
//   }

//   /// **Validate Inputs**
//   bool _validateInputs() {
//     return tenantIdController.text.isNotEmpty &&
//         firstNameController.text.isNotEmpty &&
//         emailController.text.isNotEmpty &&
//         phoneController.text.isNotEmpty &&
//         rentController.text.isNotEmpty &&
//         unitIdController.text.isNotEmpty &&
//         passwordController.text.isNotEmpty; // ✅ Password is now required
//   }

//   /// **Clear All Fields**
//   void clearForm() {
//     tenantIdController.clear();
//     firstNameController.clear();
//     lastNameController.clear();
//     emailController.clear();
//     phoneController.clear();
//     rentController.clear();
//     unitIdController.clear();
//     passwordController.clear();
//     selectedStatus.value = '';
//     paymentStatus.value = '';
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTenantController extends GetxController {
  final tenantIdController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final rentController = TextEditingController();
  final passwordController = TextEditingController();

  // **Property & Unit Selections**
  final RxString selectedPropertyName = ''.obs;
  final RxString selectedPropertyId = ''.obs;
  final RxList<Map<String, String>> properties = <Map<String, String>>[].obs;
  final RxList<String> units = <String>[].obs;
  final RxString selectedUnitId = ''.obs;

  // Dropdown selections
  final RxString selectedStatus = ''.obs;
  final RxString paymentStatus = ''.obs;
  final RxBool isSubmitting = false.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// **Fetch Properties from Firestore (Real-Time)**
  Stream<List<Map<String, String>>> getPropertiesStream() {
    return firestore.collection('All Properties').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        String propertyName = doc['title'];
        String propertyId = doc.id.substring(0, 3); // First 3 characters of ID
        return {'id': doc.id, 'title': "$propertyName ($propertyId)"};
      }).toList();
    });
  }

  /// **Fetch Units for Selected Property (Real-Time)**
  Stream<List<String>> getUnitsStream(String propertyId) {
    return firestore
        .collection('All Properties')
        .doc(propertyId)
        .collection('Units')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.id.substring(0, 8)).toList();
    });
  }

  Future<void> addTenant() async {
    if (!_validateInputs()) {
      Get.snackbar('Error', 'Please fill all required fields.');
      return;
    }

    try {
      isSubmitting.value = true;

      String tenantId = tenantIdController.text.trim();
      String fullName =
          '${firstNameController.text} ${lastNameController.text}';
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String rent = rentController.text.trim();
      String propertyId = selectedPropertyId.value;
      String propertyName = selectedPropertyName.value;
      String unitId = selectedUnitId.value;
      String status = selectedStatus.value;
      String paymentStatus = '';
      String password = passwordController.text.trim();

      // Get current timestamp
      String createdDate = DateTime.now().toIso8601String();

      // ✅ 1️⃣ Add Tenant to `All Users`
      DocumentReference tenantRef =
          await firestore.collection('All Users').add({
        'tenantId': tenantId,
        'name': fullName,
        'email': email,
        'phone': phone,
        'propertyId': propertyId,
        'propertyName': propertyName,
        'unitId': unitId,
        'status': status,
        'paymentStatus': paymentStatus,
        'password': password,
        'createdDate': createdDate,
        'updatedDate': createdDate, // Initially same as created date
      });

      // ✅ 2️⃣ Add Assigned Unit to `Booked Units` subcollection
      await tenantRef.collection('Booked Units').doc(unitId).set({
        'unitId': unitId,
        'propertyId': propertyId,
        'rentAmount': double.parse(rent),
        'startDate': DateTime.now().toIso8601String(),
        'endDate': DateTime.now()
            .add(Duration(days: 365))
            .toIso8601String(), // Example: 1-year lease
        'depositAmount': 500, // Example deposit
        'paymentStatus': paymentStatus,
        'paid': paymentStatus == "Paid",
        'bookedAt': createdDate,
      });

      Get.snackbar('Success', 'Tenant and assigned unit added successfully.');
      clearForm();
      Get.offAllNamed('/tenant-screen');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    } finally {
      isSubmitting.value = false;
    }
  }

  // /// **Add Tenant to Firestore**
  // Future<void> addTenant() async {
  //   if (!_validateInputs()) {
  //     Get.snackbar('Error', 'Please fill all required fields.');
  //     return;
  //   }

  //   try {
  //     isSubmitting.value = true;

  //     final tenantData = {
  //       'tenantId': tenantIdController.text,
  //       'name': '${firstNameController.text} ${lastNameController.text}',
  //       'email': emailController.text.trim(),
  //       'phone': phoneController.text,
  //       'rent': rentController.text,
  //       'propertyId': selectedPropertyId.value, // ✅ Full Property ID
  //       'propertyName': selectedPropertyName.value, // ✅ Property Name
  //       'unitId': selectedUnitId.value, // ✅ Selected Unit ID
  //       'status': selectedStatus.value,
  //       'paymentStatus': paymentStatus.value,
  //       'password': passwordController.text.trim(),
  //       'createdDate': DateTime.now().toIso8601String(),
  //       'updatedDate': DateTime.now().toIso8601String(),
  //     };

  //     await firestore.collection('All Users').add(tenantData);

  //     Get.snackbar('Success', 'Tenant added successfully.');
  //     clearForm();
  //     Get.offAllNamed('/tenant-screen');
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to add tenant: $e');
  //   } finally {
  //     isSubmitting.value = false;
  //   }
  // }

  // /// **Validate Inputs**
  bool _validateInputs() {
    return tenantIdController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        rentController.text.isNotEmpty &&
        selectedPropertyName.value.isNotEmpty &&
        selectedUnitId.value.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  /// **Clear All Fields**
  void clearForm() {
    tenantIdController.clear();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    rentController.clear();
    passwordController.clear();
    selectedPropertyName.value = '';
    selectedPropertyId.value = '';
    selectedUnitId.value = '';
    selectedStatus.value = '';
    paymentStatus.value = '';
  }
}
