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
  final Rx<File?> selectedFile = Rx<File?>(null);
  final database = FirebaseDatabase.instance;
  final firestore = FirebaseFirestore.instance;

  /// Select a file (PDF)
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'], // Allow only PDF files
      );

      if (result != null) {
        selectedFile.value = File(result.files.single.path!);
        Get.snackbar('File Selected', 'File: ${selectedFile.value!.path}');
      } else {
        Get.snackbar('No File Selected', 'Please select a lease document.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to select a file: $e');
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

  /// Add tenant to Firestore
  Future<void> addTenant() async {
    if (!_validateInputs()) {
      Get.snackbar('Error', 'Please fill all required fields.');
      return;
    }

    try {
      isSubmitting.value = true;

      // Upload the lease document to Firebase Realtime Database
      String? filePath;
      if (selectedFile.value != null) {
        final tenantFileRef =
            database.ref('tenants/${tenantIdController.text}/lease_document');
        final fileData = selectedFile.value!.readAsBytesSync();
        await tenantFileRef.set(fileData);
        filePath = tenantFileRef.path;
      }
      final leaseStartFormatted = _formatDate(leaseStartController.text);
      final leaseEndFormatted = _formatDate(leaseEndController.text);

      // Prepare tenant data
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
        'leaseDocumentPath': filePath ?? '',
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
      };

      // Add tenant data to Firestore
      await firestore.collection('All Tenants').add(tenantData);

      Get.snackbar('Success', 'Tenant added successfully.');
      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    } finally {
      isSubmitting.value = false; // Stop the loading indicator
    }
  }

  /// Validate inputs
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
    selectedFile.value = null;
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
