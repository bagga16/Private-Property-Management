import 'package:flutter/material.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddTanentsScreen extends StatelessWidget {
  const AddTanentsScreen({super.key});

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
              const CustomTextField(
                  hintText: "Tenant ID", height: 48, borderRadius: 10),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "First Name"),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "Last Name"),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "Email Address"),
              const SizedBox(height: 10),
              const CustomTextField(
                  height: 48, borderRadius: 10, hintText: "Phone Number"),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          height: 48, hintText: "Lease Start Date")),
                  SizedBox(width: 10),
                  Expanded(
                      child: CustomTextField(
                          height: 48, hintText: "Lease End Date")),
                ],
              ),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Monthly Rent"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Unit ID"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Tenant Status"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Security Deposit"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Payment Status"),
              const SizedBox(height: 10),
              const CustomTextField(height: 48, hintText: "Lease Document"),
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
