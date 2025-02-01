import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class EditTenantController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Text Controllers
  final TextEditingController tenantIdController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController leaseStartController = TextEditingController();
  final TextEditingController leaseEndController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController securityDepositController =
      TextEditingController();

  // Dropdown selections
  final RxString selectedStatus = ''.obs;
  final RxString paymentStatus = ''.obs;
  final RxBool isLoading = false.obs;

  late String tenantId;

  /// Initialize with existing tenant data
  void initialize(Tenant tenant) {
    tenantId = tenant.id;

    tenantIdController.text = tenant.id;
    firstNameController.text = tenant.name.split(' ').first;
    lastNameController.text = tenant.name.split(' ').last;
    emailController.text = tenant.email;
    phoneController.text = tenant.phone;
    leaseStartController.text = tenant.leaseStart;
    leaseEndController.text = tenant.leaseEnd;
    rentController.text = tenant.rentAmount;
    //securityDepositController.text = tenant. ?? '';
    //selectedStatus.value = tenant.;
    //paymentStatus.value = tenant.st ?? '';
  }

  /// Update Tenant Details
  Future<void> updateTenant() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final updatedData = {
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'phone': phoneController.text,
        'leaseStart': leaseStartController.text,
        'leaseEnd': leaseEndController.text,
        'rent': rentController.text,
        'securityDeposit': securityDepositController.text,
        'status': selectedStatus.value,
        'paymentStatus': paymentStatus.value,
        'updatedDate': DateTime.now().toIso8601String(),
      };

      await firestore
          .collection('All Tenants')
          .doc(tenantId)
          .update(updatedData);

      Get.snackbar('Success', 'Tenant updated successfully.');
      Get.offAllNamed('/tenant-screen');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update tenant: $e');
    } finally {
      isLoading.value = false;
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
}
