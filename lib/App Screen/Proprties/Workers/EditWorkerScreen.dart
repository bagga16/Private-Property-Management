import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/PropertyController.dart';
import 'package:private_property_management/Controllers/WorkerControllrs/EditWorkerController.dart';
import 'package:private_property_management/Models/PropertyModel.dart';
import 'package:private_property_management/Widgest/WorkerPropertyCard.dart';

class EditWorkerScreen extends StatelessWidget {
  final Map<String, dynamic> workerData;
  final String workerDocumentId;

  EditWorkerScreen({
    Key? key,
    required this.workerData,
    required this.workerDocumentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditWorkerController controller = Get.put(EditWorkerController());
    final PropertyController propertyController =
        Get.find<PropertyController>();

    // Load worker data into the controller
    controller.loadWorkerData(workerDocumentId, workerData);

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
                      "Edit Worker",
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
                TextFormField(
                  controller: controller.firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Obx(() {
                  return DropdownButtonFormField<String>(
                    value: controller.selectedRole.value,
                    onChanged: (value) {
                      controller.selectedRole.value = value!;
                    },
                    decoration: InputDecoration(
                      labelText: "Role",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                  );
                }),
                const SizedBox(height: 28),

                // Assign Properties Section
                const Text(
                  "Assign Properties",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                const SizedBox(height: 32),

                // Update Worker Button
                ElevatedButton(
                  onPressed: () async {
                    await controller.updateWorker();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
