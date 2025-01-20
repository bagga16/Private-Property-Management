import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AddPropertyController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddPropertyController controller = Get.put(AddPropertyController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.clearInputs();
                        Get.back();
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                      ),
                    ),
                    const Text(
                      "Add Property",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: controller.pickImages,
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
                Obx(() {
                  if (controller.selectedImages.isEmpty) {
                    return const SizedBox();
                  }
                  return SizedBox(
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
                  );
                }),
                const SizedBox(height: 16),
                CustomTextField(
                    controller: controller.propertyIdController,
                    hintText: "Property ID",
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: controller.propertyNameController,
                    height: 48,
                    borderRadius: 10,
                    hintText: "Property Name"),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: controller.addressController,
                    height: 48,
                    borderRadius: 10,
                    hintText: "Address Line"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: controller.cityController,
                            height: 48,
                            hintText: "City")),
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomTextField(
                            controller: controller.stateController,
                            height: 48,
                            hintText: "State")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: controller.zipController,
                            height: 48,
                            hintText: "Zip Code")),
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomTextField(
                            controller: controller.countryController,
                            height: 48,
                            hintText: "Country")),
                  ],
                ),
                const SizedBox(height: 10),
                // Dropdown for Property Type
                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    value: controller.selectedPropertyType.value,
                    onChanged: (value) {
                      controller.selectedPropertyType.value = value!;
                    },
                    decoration: InputDecoration(
                      fillColor: Color.fromRGBO(245, 244, 248, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Property Type",
                    ),
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w500),
                    items: const [
                      DropdownMenuItem(
                          value: "Commercial", child: Text("Commercial")),
                      DropdownMenuItem(
                          value: "Industrial", child: Text("Industrial")),
                      DropdownMenuItem(
                          value: "Residential", child: Text("Residential")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    value: controller.selectedStatus.value,
                    onChanged: (value) {
                      controller.selectedStatus.value = value!;
                    },
                    decoration: InputDecoration(
                      fillColor: Color.fromRGBO(245, 244, 248, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Select Status",
                    ),
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w500),
                    items: const [
                      DropdownMenuItem(value: "Active", child: Text("Active")),
                      DropdownMenuItem(
                          value: "In-Active", child: Text("In-Active")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: controller.descriptionController,
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
                      onPressed: controller.addProperty,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
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
        Obx(() {
          return controller.isSubmitting.value
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : const SizedBox.shrink();
        }),
      ]),
    );
  }
}
