// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

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
//   final RxString selectedStatus = ''.obs;
//   final RxString paymentStatus = ''.obs;

//   final Rx<File?> selectedFile = Rx<File?>(null);

//   final picker = ImagePicker();
//   final database = FirebaseDatabase.instance;

//   // Select File
//   Future<void> pickFile() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedFile.value = File(pickedFile.path);
//     }
//   }

//   // Add Tenant to Firestore and Realtime Database
//   Future<void> addTenant() async {
//     if (tenantIdController.text.isEmpty ||
//         firstNameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         phoneController.text.isEmpty ||
//         rentController.text.isEmpty ||
//         unitIdController.text.isEmpty) {
//       Get.snackbar('Error', 'Please fill all required fields.');
//       return;
//     }

//     try {
//       // Upload the file to Realtime Database if selected
//       String? fileUrl;
//       if (selectedFile.value != null) {
//         final fileRef = database.ref('tenants/${tenantIdController.text}');
//         final uploadTask = fileRef
//             .child('lease_document')
//             .set(selectedFile.value!.readAsBytesSync());
//         await uploadTask;
//         fileUrl = fileRef.child('lease_document').key;
//       }

//       // Prepare tenant data
//       final tenantData = {
//         'tenantId': tenantIdController.text,
//         'name': '${firstNameController.text} ${lastNameController.text}',
//         'email': emailController.text,
//         'phone': phoneController.text,
//         'leaseStart': leaseStartController.text,
//         'leaseEnd': leaseEndController.text,
//         'rent': rentController.text,
//         'unitId': unitIdController.text,
//         'status': selectedStatus.value,
//         'paymentStatus': paymentStatus.value,
//         'securityDeposit': securityDepositController.text,
//         'leaseDocumentUrl': fileUrl ?? '',
//         'createdDate': DateTime.now().toIso8601String(),
//         'updatedDate': DateTime.now().toIso8601String(),
//       };

//       // Add tenant data to Firestore
//       await FirebaseFirestore.instance
//           .collection('All Tenants')
//           .add(tenantData);

//       // Show success message
//       Get.snackbar('Success', 'Tenant added successfully.');

//       // Clear form
//       clearForm();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add tenant: $e');
//     }
//   }

//   // Clear the form
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
//     selectedFile.value = null;
//   }
// }
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddTenantController extends GetxController {
  final tenantIdController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final leaseStartController = TextEditingController();
  final leaseEndController = TextEditingController();
  final rentController = TextEditingController();
  final unitIdController = TextEditingController();
  final securityDepositController = TextEditingController();
  final RxString selectedStatus = ''.obs;
  final RxString paymentStatus = ''.obs;

  final Rx<File?> selectedFile = Rx<File?>(null);

  final picker = ImagePicker();
  final database = FirebaseDatabase.instance;

  // Select File
  Future<void> pickFile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedFile.value = File(pickedFile.path);
    }
  }

  // Add Tenant to Firestore and Realtime Database
  Future<void> addTenant() async {
    if (tenantIdController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        rentController.text.isEmpty ||
        unitIdController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields.');
      return;
    }

    try {
      // Upload the file to Realtime Database if selected
      String? fileUrl;
      if (selectedFile.value != null) {
        final fileRef = database.ref('tenants/${tenantIdController.text}');
        final uploadTask = fileRef
            .child('lease_document')
            .set(selectedFile.value!.readAsBytesSync());
        await uploadTask;
        fileUrl = fileRef.child('lease_document').key;
      }

      // Prepare tenant data
      final tenantData = {
        'tenantId': tenantIdController.text,
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'phone': phoneController.text,
        'leaseStart': leaseStartController.text,
        'leaseEnd': leaseEndController.text,
        'rent': rentController.text,
        'unitId': unitIdController.text,
        'status': selectedStatus.value,
        'paymentStatus': paymentStatus.value,
        'securityDeposit': securityDepositController.text,
        'leaseDocumentUrl': fileUrl ?? '',
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
      };

      // Add tenant data to Firestore
      await FirebaseFirestore.instance
          .collection('All Tenants')
          .add(tenantData);

      // Show success message
      Get.snackbar('Success', 'Tenant added successfully.');

      // Clear form
      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    }
  }

  // Clear the form
  void clearForm() {
    tenantIdController.clear();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    leaseStartController.clear();
    leaseEndController.clear();
    rentController.clear();
    unitIdController.clear();
    securityDepositController.clear();
    selectedStatus.value = '';
    paymentStatus.value = '';
    selectedFile.value = null;
  }
}
