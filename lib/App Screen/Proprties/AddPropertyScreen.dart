import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:private_property_management/Widgest/CustomTextField.dart';
import 'package:uuid/uuid.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final List<File> _selectedImages = [];
  final TextEditingController _propertyIdController = TextEditingController();
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _propertyTypeController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final DatabaseReference _realtimeDB =
      FirebaseDatabase.instance.ref().child('property_images');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid uuid = const Uuid();

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _selectedImages
            .addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
      });
    }
  }

  Future<void> _addPropertyToFirebase() async {
    //  Validate fields before proceeding
    if (_propertyNameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _stateController.text.isEmpty ||
        _zipController.text.isEmpty ||
        _countryController.text.isEmpty ||
        _propertyTypeController.text.isEmpty ||
        _statusController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedImages.isEmpty) {
      _showAlertDialog("All fields must be filled.");
      return;
    }

    try {
      //  Generate a unique property ID
      final String propertyId = uuid.v4();
      List<String> imageUrls = [];

      //  Upload images to Firebase Realtime Database as Base64
      for (File image in _selectedImages) {
        final imageBytes = await image.readAsBytes();
        final imageBase64 = base64Encode(imageBytes);
        await _realtimeDB.child(propertyId).push().set({'image': imageBase64});
        imageUrls.add(imageBase64);
      }

      //  Prepare property data map for Firestore
      Map<String, dynamic> propertyData = {
        'propertyId': _propertyIdController.text.trim(),
        'title': _propertyNameController.text.trim(),
        'id': propertyId,
        'address':
            "${_addressController.text.trim()}, ${_cityController.text.trim()}, ${_stateController.text.trim()}, ${_zipController.text.trim()}, ${_countryController.text.trim()}",
        'type': _propertyTypeController.text.trim(),
        'units': int.tryParse(_zipController.text) ?? 0,
        'description': _descriptionController.text.trim(),
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
        'status': _statusController.text.trim(),
        'imageUrls': imageUrls,
        'rent': "\$200",
      };

      //  Save property data to Firestore
      await _firestore
          .collection('All Properties')
          .doc(propertyId)
          .set(propertyData);

      _showAlertDialog("Property added successfully!");
      Navigator.pop(context);
    } catch (e) {
      _showAlertDialog("Error adding property: ${e.toString()}");
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                    onTap: () => Navigator.pop(context),
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
                  const Text('           '),
                ],
              ),
              const SizedBox(height: 16),
              // Image Picker Section
              GestureDetector(
                onTap: _pickImages,
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
              if (_selectedImages.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _selectedImages[index],
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
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _propertyIdController,
                  hintText: "Property ID",
                  height: 48,
                  borderRadius: 10),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _propertyNameController,
                  height: 48,
                  borderRadius: 10,
                  hintText: "Property Name"),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _addressController,
                  height: 48,
                  borderRadius: 10,
                  hintText: "Address Line"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          controller: _cityController,
                          height: 48,
                          hintText: "City")),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField(
                          controller: _stateController,
                          height: 48,
                          hintText: "State")),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          controller: _zipController,
                          height: 48,
                          hintText: "Zip Code")),
                  const SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField(
                          controller: _countryController,
                          height: 48,
                          hintText: "Country")),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _propertyTypeController,
                  height: 48,
                  hintText: "Property Type"),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _statusController,
                  height: 48,
                  hintText: "Status"),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _descriptionController,
                height: 156,
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
                      _addPropertyToFirebase();
                    },
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
    );
  }
}
