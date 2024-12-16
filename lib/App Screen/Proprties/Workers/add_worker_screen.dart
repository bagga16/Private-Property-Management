import 'package:flutter/material.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddWorkerScreen extends StatelessWidget {
  const AddWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Worker",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const CustomTextField(hintText: "Worker ID"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "First Name"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Last Name"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Email Address"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Phone Number"),
            const SizedBox(height: 12),
            const CustomTextField(hintText: "Role"),
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
                onPressed: () {},
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
