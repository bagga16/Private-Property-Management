import 'package:flutter/material.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
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
                    "Add Propery",
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
              const CustomTextField(height: 48, hintText: "PropertyType"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Stataus"),
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
                    onPressed: () {},
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
