import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddTanentsScreen extends StatefulWidget {
  const AddTanentsScreen({super.key});

  @override
  State<AddTanentsScreen> createState() => _AddTanentsScreenState();
}

class _AddTanentsScreenState extends State<AddTanentsScreen> {
  // Controllers for TextFields
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

  // Drop-down selected values
  String? selectedStatus;
  String? selectedPaymentStatus;

  // File selection
  File? selectedFile;
  final picker = ImagePicker();

  // Firebase instances
  final databaseRef = FirebaseDatabase.instance.ref();
  final firestoreRef = FirebaseFirestore.instance;

  // Function to pick a file
  Future<void> pickFile() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedFile = File(pickedFile.path);
      });
    } else {
      Get.snackbar('No File Selected', 'Please select a lease document.');
    }
  }

  // Function to add tenant
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
      // Upload file to Realtime Database
      String? fileUrl;
      if (selectedFile != null) {
        final fileRef = databaseRef
            .child('tenants/${tenantIdController.text}/lease_document');
        await fileRef.set(selectedFile!.readAsBytesSync());
        fileUrl = fileRef.path; // Path where the file is stored
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
        'status': selectedStatus ?? '',
        'paymentStatus': selectedPaymentStatus ?? '',
        'securityDeposit': securityDepositController.text,
        'leaseDocumentUrl': fileUrl ?? '',
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
      };

      // Add data to Firestore
      await firestoreRef.collection('All Tenants').add(tenantData);

      // Success message
      Get.snackbar('Success', 'Tenant added successfully.');
      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    }
  }

  // Function to clear form
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
    selectedStatus = null;
    selectedPaymentStatus = null;
    selectedFile = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    controller: tenantIdController,
                    hintText: "Tenant ID",
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: firstNameController,
                    hintText: "First Name",
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: lastNameController,
                    hintText: "Last Name",
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: emailController,
                    hintText: "Email Address",
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: phoneController,
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    height: 48,
                    borderRadius: 10),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: leaseStartController,
                            height: 48,
                            keyboardType: TextInputType.datetime,
                            hintText: "Lease Start Date")),
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomTextField(
                            controller: leaseEndController,
                            height: 48,
                            keyboardType: TextInputType.datetime,
                            hintText: "Lease End Date")),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: rentController,
                    height: 48,
                    keyboardType: TextInputType.phone,
                    hintText: "Monthly Rent"),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: unitIdController,
                    height: 48,
                    hintText: "Unit ID"),
                const SizedBox(height: 10),
                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    value: selectedStatus,
                    onChanged: (value) => setState(() {
                      selectedStatus = value;
                    }),
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
                    items: const [
                      DropdownMenuItem(value: "Active", child: Text("Active")),
                      DropdownMenuItem(
                          value: "In-Active", child: Text("In-Active")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: securityDepositController,
                    height: 48,
                    hintText: "Security Deposit"),
                const SizedBox(height: 10),
                Container(
                  height: 48,
                  child: DropdownButtonFormField<String>(
                    value: selectedPaymentStatus,
                    onChanged: (value) => setState(() {
                      selectedPaymentStatus = value;
                    }),
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
                    items: const [
                      DropdownMenuItem(value: "Paid", child: Text("Paid")),
                      DropdownMenuItem(
                          value: "Over Due", child: Text("Over Due")),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: pickFile,
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/icons/document.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          selectedFile != null
                              ? "File Selected"
                              : "Lease Document",
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              fontWeight: FontWeight.w600),
                        )
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
                      onPressed: addTenant,
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
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:private_property_management/Widgest/CustomTextField.dart';

// class AddTanentsScreen extends StatefulWidget {
//   const AddTanentsScreen({super.key});

//   @override
//   State<AddTanentsScreen> createState() => _AddTanentsScreenState();
// }

// class _AddTanentsScreenState extends State<AddTanentsScreen> {
//   // Controllers for TextFields
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

//   // Drop-down selected values
//   String? selectedStatus;
//   String? selectedPaymentStatus;

//   // File selection
//   File? selectedFile;

//   // Firebase instances
//   final databaseRef = FirebaseDatabase.instance.ref();
//   final firestoreRef = FirebaseFirestore.instance;

//   // Function to pick a file
//   Future<void> pickFile() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf'], // Allow only PDF files
//       );

//       if (result != null) {
//         setState(() {
//           selectedFile = File(result.files.single.path!);
//         });
//       } else {
//         Get.snackbar('No File Selected', 'Please select a lease document.');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to select a file: $e');
//     }
//   }

//   // Function to add tenant
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
//       // Upload file to Realtime Database
//       String? fileUrl;
//       if (selectedFile != null) {
//         final fileRef = databaseRef.child(
//             'tenants/${tenantIdController.text}/lease_document'); // Path in Realtime Database
//         final fileBytes = selectedFile!.readAsBytesSync();
//         await fileRef.set(fileBytes); // Store the file as binary data
//         fileUrl = fileRef.path; // Path where the file is stored
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
//         'status': selectedStatus ?? '',
//         'paymentStatus': selectedPaymentStatus ?? '',
//         'securityDeposit': securityDepositController.text,
//         'leaseDocumentUrl': fileUrl ?? '',
//         'createdDate': DateTime.now().toIso8601String(),
//         'updatedDate': DateTime.now().toIso8601String(),
//       };

//       // Add data to Firestore
//       await firestoreRef.collection('All Tenants').add(tenantData);

//       // Success message
//       Get.snackbar('Success', 'Tenant added successfully.');
//       clearForm();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to add tenant: $e');
//     }
//   }

//   // Function to clear form
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
//     selectedStatus = null;
//     selectedPaymentStatus = null;
//     selectedFile = null;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(24, 6, 24, 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: const CircleAvatar(
//                         radius: 22,
//                         backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                         child: Icon(Icons.arrow_back_ios_new,
//                             color: Color.fromRGBO(37, 43, 92, 1), size: 16),
//                       ),
//                     ),
//                     const Text(
//                       "Add Tenant",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         color: Color.fromRGBO(37, 43, 92, 1),
//                       ),
//                     ),
//                     const Text('           ')
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 CustomTextField(
//                     controller: tenantIdController,
//                     hintText: "Tenant ID",
//                     height: 48,
//                     borderRadius: 10),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: firstNameController,
//                     hintText: "First Name",
//                     height: 48,
//                     borderRadius: 10),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: lastNameController,
//                     hintText: "Last Name",
//                     height: 48,
//                     borderRadius: 10),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: emailController,
//                     hintText: "Email Address",
//                     height: 48,
//                     borderRadius: 10),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: phoneController,
//                     hintText: "Phone Number",
//                     keyboardType: TextInputType.phone,
//                     height: 48,
//                     borderRadius: 10),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: CustomTextField(
//                             controller: leaseStartController,
//                             height: 48,
//                             keyboardType: TextInputType.datetime,
//                             hintText: "Lease Start Date")),
//                     const SizedBox(width: 10),
//                     Expanded(
//                         child: CustomTextField(
//                             controller: leaseEndController,
//                             height: 48,
//                             keyboardType: TextInputType.datetime,
//                             hintText: "Lease End Date")),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: rentController,
//                     height: 48,
//                     keyboardType: TextInputType.phone,
//                     hintText: "Monthly Rent"),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: unitIdController,
//                     height: 48,
//                     hintText: "Unit ID"),
//                 const SizedBox(height: 10),
//                 Container(
//                   height: 48,
//                   child: DropdownButtonFormField<String>(
//                     value: selectedStatus,
//                     onChanged: (value) => setState(() {
//                       selectedStatus = value;
//                     }),
//                     decoration: InputDecoration(
//                       fillColor: const Color.fromRGBO(245, 244, 248, 1),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       hintText: "Tenant Status",
//                       hintStyle: const TextStyle(
//                           height: 2.5,
//                           fontSize: 13,
//                           color: Color.fromRGBO(37, 43, 92, 1),
//                           fontWeight: FontWeight.w500),
//                     ),
//                     items: const [
//                       DropdownMenuItem(value: "Active", child: Text("Active")),
//                       DropdownMenuItem(
//                           value: "In-Active", child: Text("In-Active")),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                     controller: securityDepositController,
//                     height: 48,
//                     hintText: "Security Deposit"),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: pickFile,
//                   child: Container(
//                     width: double.infinity,
//                     height: 48,
//                     decoration: BoxDecoration(
//                         color: const Color.fromRGBO(245, 244, 248, 1),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 10),
//                         Image.asset('assets/icons/document.png'),
//                         const SizedBox(width: 10),
//                         Text(
//                           selectedFile != null
//                               ? selectedFile!.path.split('/').last
//                               : "Select Lease Document",
//                           style: const TextStyle(
//                               fontSize: 13,
//                               color: Color.fromRGBO(37, 43, 92, 1),
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 100),
//                 Center(
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width - 96,
//                     height: 60,
//                     child: ElevatedButton(
//                       onPressed: addTenant,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         "Add",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
