import 'package:flutter/material.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({super.key});

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
          "Unit Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Apartment 101",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "This unit comes with a Smart Home System and Viking Style. "
              "You can see the sunrise from the full glass window with a city view.",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(115, 115, 115, 1),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                _DetailItem(label: "Unit ID", value: "2655963"),
                _DetailItem(label: "Property ID", value: "2655963"),
                _DetailItem(label: "Unit Type", value: "Office"),
                _DetailItem(label: "Status", value: "Vacant"),
                _DetailItem(label: "Area", value: "101 sq. ft"),
                _DetailItem(label: "Rent Amount", value: "\$350/month"),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Created: 20/01/2024",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              "Updated: 20/01/2024",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Color.fromRGBO(139, 200, 63, 1)),
        const SizedBox(width: 8),
        Text(
          "$label: $value",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
