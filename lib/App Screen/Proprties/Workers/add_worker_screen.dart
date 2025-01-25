import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/WorkerControllrs/AddWorkerController.dart';
import 'package:private_property_management/Controllers/PropertyController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';
import 'package:private_property_management/Widgest/WorkerPropertyCard.dart';

class AddWorkerScreen extends StatelessWidget {
  final AddWorkerController _workerController = Get.put(AddWorkerController());
  final PropertyController _propertyController = Get.find<PropertyController>();

  final TextEditingController workerIdController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  RxString selectedRole = ''.obs;

  AddWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                      ),
                    ),
                    const Text(
                      "Add Worker",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Input Fields
                CustomTextField(
                  height: 48,
                  controller: workerIdController,
                  hintText: "Worker ID",
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  height: 48,
                  controller: firstNameController,
                  hintText: "First Name",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  height: 48,
                  controller: lastNameController,
                  hintText: "Last Name",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  height: 48,
                  controller: emailController,
                  hintText: "Email Address",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  height: 48,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: "Phone Number",
                ),
                const SizedBox(height: 10),

                Obx(() {
                  return Container(
                    height: 48,
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      value: selectedRole.value.isEmpty
                          ? null
                          : selectedRole.value,
                      onChanged: (value) {
                        selectedRole.value = value!;
                      },
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(245, 244, 248, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Role",
                        hintStyle: const TextStyle(
                          height: 2.5,
                          fontSize: 13,
                          color: Color.fromRGBO(37, 43, 92, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w500,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Manager",
                          child: Text("Manager"),
                        ),
                        DropdownMenuItem(
                          value: "Worker",
                          child: Text("Worker"),
                        ),
                        DropdownMenuItem(
                          value: "Admin",
                          child: Text("Admin"),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 28),

                // Assign Properties Section
                const Row(
                  children: [
                    Text(
                      "Assign Properties",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search Field for Properties
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchController,
                    // onChanged: (query) {
                    //   _propertyController.searchProperties(query);
                    // },
                    decoration: const InputDecoration(
                      hintText: "Search Property To Assign",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        size: 22,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Obx(() {
                  if (_propertyController.filteredProperties.isEmpty) {
                    return const Center(
                      child: Text("No properties found."),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _propertyController.filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property =
                          _propertyController.filteredProperties[index];
                      final isSelected = _workerController.selectedProperties
                          .contains(property);
                      return GestureDetector(
                        onTap: () => _workerController.toggleProperty(property),
                        child: Workerpropertycard(
                          property: property,
                          isSelected: isSelected,
                        ),
                      );
                    },
                  );
                }),

                const SizedBox(height: 32),

                // Add Worker Button
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width - 96,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      if (selectedRole.value.isEmpty) {
                        Get.snackbar(
                          "Role Missing",
                          "Please select a role for the worker.",
                        );
                        return;
                      }
                      await _workerController.addWorker(
                        workerId: workerIdController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        role: selectedRole.value,
                      );
                      Get.back(); // Navigate back after adding the worker
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
