import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      setState(() {
        _selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
      });
    }
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
              const CustomTextField(
                  hintText: "Property ID", height: 48, borderRadius: 10),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "Property Name"),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "Address Line"),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                      child: CustomTextField(height: 48, hintText: "City")),
                  SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField(height: 48, hintText: "State")),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                      child: CustomTextField(height: 48, hintText: "Zip Code")),
                  SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField(height: 48, hintText: "Country")),
                ],
              ),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Property Type"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Status"),
              const SizedBox(height: 10),
              const CustomTextField(
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
                      // Handle Add button functionality
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
