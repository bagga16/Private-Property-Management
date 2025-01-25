import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

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

  // Dropdown selections
  final RxString selectedStatus = ''.obs;
  final RxString paymentStatus = ''.obs;
  // Tracks submission status
  final RxBool isSubmitting = false.obs;

  // Selected file

  final RxList<File> selectedFiles = RxList<File>();
  // final Rx<File?> selectedFile = Rx<File?>(null);
  final database = FirebaseDatabase.instance;
  final firestore = FirebaseFirestore.instance;

  /// Select multiple files (PDFs)
  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true, // Allow multiple files
      );

      if (result != null) {
        selectedFiles.addAll(result.paths.map((path) => File(path!)));
        Get.snackbar(
            'Files Selected', '${selectedFiles.length} file(s) selected.');
      } else {
        Get.snackbar(
            'No Files Selected', 'Please select at least one lease document.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to select files: $e');
    }
  }

  Future<void> pickLeaseDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.text =
          DateFormat('dd/MM/yyyy').format(pickedDate); // Format the picked date
    } else {
      Get.snackbar('Cancelled', 'No date selected');
    }
  }

  Future<void> addTenant() async {
    if (!_validateInputs()) {
      Get.snackbar('Error', 'Please fill all required fields.');
      return;
    }

    try {
      isSubmitting.value = true;

      // Prepare tenant data
      final leaseStartFormatted = _formatDate(leaseStartController.text);
      final leaseEndFormatted = _formatDate(leaseEndController.text);

      final tenantData = {
        'tenantId': tenantIdController.text,
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'phone': phoneController.text,
        'leaseStart': leaseStartFormatted,
        'leaseEnd': leaseEndFormatted,
        'rent': rentController.text,
        'unitId': unitIdController.text,
        'status': selectedStatus.value,
        'paymentStatus': paymentStatus.value,
        'securityDeposit': securityDepositController.text,
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
      };

      // Add tenant data to Firestore and get the document ID
      DocumentReference tenantDocRef =
          await firestore.collection('All Tenants').add(tenantData);

      // Upload lease documents to Realtime Database under the correct tenant ID
      final leaseDocsRef = database.ref(
          'tenants/${tenantDocRef.id}/lease_documents'); // Use Firestore doc ID

      for (var file in selectedFiles) {
        final uniqueKey =
            leaseDocsRef.push().key; // Generate unique key for each file
        if (uniqueKey != null) {
          final fileName = file.path.split('/').last;
          await leaseDocsRef.child(uniqueKey).set({
            "fileName": fileName,
            "fileData": file.readAsBytesSync().toList(),
            "uploadDate": DateTime.now().toIso8601String(),
          });
        }
      }

      Get.snackbar('Success', 'Tenant added successfully.');
      clearForm();
      Get.offAllNamed('/tenant-screen');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    } finally {
      isSubmitting.value = false; // Stop the loading indicator
    }
  }

// Validate inputs
  bool _validateInputs() {
    return tenantIdController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        leaseStartController.text.isNotEmpty &&
        leaseEndController.text.isNotEmpty &&
        rentController.text.isNotEmpty &&
        unitIdController.text.isNotEmpty;
  }

  /// Clear all input fields
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
    selectedFiles.clear();
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateFormat('dd/MM/yyyy').parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      throw FormatException("Invalid date format: $date");
    }
  }
}
