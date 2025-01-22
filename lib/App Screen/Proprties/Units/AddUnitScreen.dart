import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/Units%20Controller/AddUnitController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddUnitScreen extends StatelessWidget {
  final AddUnitController controller = Get.put(AddUnitController());

  final TextEditingController unitIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rentAmountController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final RxString unitType = ''.obs;
  final RxString availabilityStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                      ),
                    ),
                    const Text(
                      "Add Unit",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const Text('           ')
                  ],
                ),
                const SizedBox(height: 19),
                GestureDetector(
                  onTap: () => controller.pickImages(),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 244, 248, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          size: 40,
                          color: Color.fromRGBO(157, 178, 206, 1),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Add Image",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(157, 178, 206, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (controller.selectedImages.isNotEmpty)
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.selectedImages.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            controller.selectedImages[index],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                    ),
                  ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: unitIdController,
                  hintText: "Unit ID",
                  keyboardType: TextInputType.text,
                  height: 48,
                  borderRadius: 10,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: nameController,
                  height: 48,
                  borderRadius: 10,
                  hintText: "Unit Number / Name",
                ),
                const SizedBox(height: 10),
                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    onChanged: (value) => unitType.value = value ?? '',
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(245, 244, 248, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Unit Type",
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        height: 2.3,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: "Office", child: Text("Office")),
                      DropdownMenuItem(value: "House", child: Text("House")),
                      DropdownMenuItem(
                          value: "Building", child: Text("Building")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: areaController,
                  height: 48,
                  hintText: "Area",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: rentAmountController,
                  height: 48,
                  keyboardType: TextInputType.number,
                  hintText: "Rent Amount",
                ),
                const SizedBox(height: 10),
                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    onChanged: (value) =>
                        availabilityStatus.value = value ?? '',
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(245, 244, 248, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Availability Status",
                      hintStyle: const TextStyle(
                        fontSize: 13,
                        height: 2.3,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: "Occupied", child: Text("Occupied")),
                      DropdownMenuItem(value: "Vacant", child: Text("Vacant")),
                      DropdownMenuItem(
                          value: "Under Maintenance",
                          child: Text("Under Maintenance")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  height: 156,
                  maxLines: 6,
                  hintText: "Description",
                  focusBorderColor: Colors.transparent,
                ),
                const SizedBox(height: 100),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 96,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (unitIdController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            rentAmountController.text.isEmpty ||
                            areaController.text.isEmpty ||
                            unitType.value.isEmpty ||
                            availabilityStatus.value.isEmpty ||
                            descriptionController.text.isEmpty) {
                          Get.snackbar("Error", "All fields are required.");
                        } else {
                          controller.addUnit(
                            name: nameController.text,
                            unitId: unitIdController.text,
                            propertyId: "101",
                            status: availabilityStatus.value,
                            rentAmount: rentAmountController.text,
                            area: areaController.text,
                            description: descriptionController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
    );
  }
}
