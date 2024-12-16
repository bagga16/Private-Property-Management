import 'package:flutter/material.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddUnitScreen extends StatelessWidget {
  const AddUnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Unit",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CustomTextField(hintText: "Unit ID"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Unit Number / Name"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Unit Type"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Area"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Rent Amount"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Availability Status"),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Add Unit Logic
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
