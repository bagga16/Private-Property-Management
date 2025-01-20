import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AddTenantController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddTanentsScreen extends StatefulWidget {
  AddTanentsScreen({super.key});

  @override
  State<AddTanentsScreen> createState() => _AddTanentsScreenState();
}

class _AddTanentsScreenState extends State<AddTanentsScreen> {
  final AddTenantController controller = Get.put(AddTenantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 24, 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                            child: Icon(Icons.arrow_back_ios_new,
                                color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                          ),
                        ),
                        const Text(
                          "Add Tenant",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                        const Text('           ')
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: controller.tenantIdController,
                        hintText: "Tenant ID",
                        height: 48,
                        keyboardType: TextInputType.phone,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.firstNameController,
                        hintText: "First Name",
                        height: 48,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.lastNameController,
                        hintText: "Last Name",
                        height: 48,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.emailController,
                        hintText: "Email Address",
                        height: 48,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.phoneController,
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        height: 48,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await controller.pickLeaseDate(
                                  context, controller.leaseStartController);
                            },
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: controller.leaseStartController,
                                height: 48,
                                hintText: "Lease Start Date",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await controller.pickLeaseDate(
                                  context, controller.leaseEndController);
                            },
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: controller.leaseEndController,
                                height: 48,
                                hintText: "Lease End Date",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.rentController,
                        height: 48,
                        keyboardType: TextInputType.phone,
                        hintText: "Monthly Rent"),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.unitIdController,
                        height: 48,
                        keyboardType: TextInputType.phone,
                        hintText: "Unit ID"),
                    const SizedBox(height: 10),
                    Container(
                      height: 48,
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedStatus.value.isEmpty
                            ? null
                            : controller.selectedStatus.value,
                        onChanged: (value) =>
                            controller.selectedStatus.value = value!,
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(245, 244, 248, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Tenant Status",
                          hintStyle: const TextStyle(
                              height: 2.5,
                              fontSize: 13,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              fontWeight: FontWeight.w500),
                        ),
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            fontWeight: FontWeight.w500),
                        items: const [
                          DropdownMenuItem(
                              value: "Active", child: Text("Active")),
                          DropdownMenuItem(
                              value: "In-Active", child: Text("In-Active")),
                          DropdownMenuItem(
                              value: "Former Tenant",
                              child: Text("Former Tenant")),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.securityDepositController,
                        height: 48,
                        keyboardType: TextInputType.phone,
                        hintText: "Security Deposit"),
                    const SizedBox(height: 10),
                    Container(
                      height: 48,
                      child: DropdownButtonFormField<String>(
                        value: controller.paymentStatus.value.isEmpty
                            ? null
                            : controller.paymentStatus.value,
                        onChanged: (value) =>
                            controller.paymentStatus.value = value!,
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(245, 244, 248, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Payment Status",
                          hintStyle: const TextStyle(
                              height: 2.5,
                              fontSize: 13,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              fontWeight: FontWeight.w500),
                        ),
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            fontWeight: FontWeight.w500),
                        items: const [
                          DropdownMenuItem(value: "Paid", child: Text("Paid")),
                          DropdownMenuItem(
                              value: "Over Due", child: Text("Over Due")),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: controller.pickFile,
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(245, 244, 248, 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Icon(Icons.attach_file),
                            const SizedBox(width: 10),
                            Obx(() {
                              return Text(
                                controller.selectedFile.value != null
                                    ? controller.selectedFile.value!.path
                                        .split('/')
                                        .last
                                    : "Select Lease Document",
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(37, 43, 92, 1),
                                    fontWeight: FontWeight.w600),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 96,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: controller.addTenant,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(139, 200, 63, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            return controller.isSubmitting.value
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
