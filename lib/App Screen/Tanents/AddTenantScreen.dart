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
                    // **New Password Field**
                    CustomTextField(
                        controller: controller.passwordController,
                        height: 48,
                        hintText: "Password",
                        isPassword: true), // ✅ Added Password Field
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.phoneController,
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        height: 48,
                        borderRadius: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: controller.rentController,
                        height: 48,
                        keyboardType: TextInputType.phone,
                        hintText: "Monthly Rent"),
                    const SizedBox(height: 10),

                    StreamBuilder<List<Map<String, String>>>(
                      stream: controller.getPropertiesStream(),
                      builder: (context, snapshot) {
                        // **Check if the stream is still loading**
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        // **Check if there's an error**
                        if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        }

                        // **Check if data is null or empty**
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("No properties available"),
                          );
                        }

                        var properties = snapshot.data!;

                        return Container(
                          height: 48,
                          child: DropdownButtonFormField<String>(
                            value: controller.selectedPropertyName.value.isEmpty
                                ? null
                                : controller.selectedPropertyName.value,
                            decoration: InputDecoration(
                              fillColor: const Color.fromRGBO(245, 244, 248, 1),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Select Property",
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
                            items: properties
                                .map((property) => DropdownMenuItem(
                                      value: property['title'],
                                      child: Text(property['title']!),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedPropertyName.value = value!;
                              controller.selectedPropertyId.value =
                                  properties.firstWhere((element) =>
                                      element['title'] == value)['id']!;
                            },
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.selectedPropertyId.value.isEmpty) {
                        return const SizedBox();
                      }
                      return StreamBuilder<List<String>>(
                        stream: controller.getUnitsStream(
                            controller.selectedPropertyId.value),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          }

                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(
                              child:
                                  Text("No units available for this property"),
                            );
                          }

                          var units = snapshot.data!;

                          return Container(
                            height: 48,
                            child: DropdownButtonFormField<String>(
                              value: controller.selectedUnitId.value.isEmpty
                                  ? null
                                  : controller.selectedUnitId.value,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromRGBO(245, 244, 248, 1),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Select Unit",
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
                              items: units
                                  .map((unitId) => DropdownMenuItem(
                                        value: unitId,
                                        child: Text("Unit $unitId"),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedUnitId.value = value!;
                              },
                            ),
                          );
                        },
                      );
                    }),

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

                    const SizedBox(height: 70),
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
