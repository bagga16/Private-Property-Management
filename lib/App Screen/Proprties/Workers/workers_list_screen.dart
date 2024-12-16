import 'package:flutter/material.dart';
import 'package:private_property_management/Models/WorkerModel.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class WorkersListScreen extends StatelessWidget {
  const WorkersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WorkerModel> workers = [
      WorkerModel(
        name: "John Martin",
        role: "Manager",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        name: "John Martin",
        role: "Maintenance Worker",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
    ];

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
          "Workers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(hintText: "Search Here"),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    title: Text(
                      workers[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Role: ${workers[index].role}"),
                        Text("Email: ${workers[index].email}"),
                        Text("Phone: ${workers[index].phone}"),
                      ],
                    ),
                    trailing: Text(
                      workers[index].updatedDate,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
