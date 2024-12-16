import 'package:flutter/material.dart';

class PriorityStatusFilter extends StatelessWidget {
  const PriorityStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Priority Status",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ListTile(
            title: const Text("Low"),
            leading: Radio(value: 1, groupValue: 1, onChanged: (_) {}),
          ),
          ListTile(
            title: const Text("Medium"),
            leading: Radio(value: 2, groupValue: 1, onChanged: (_) {}),
          ),
          ListTile(
            title: const Text("High"),
            leading: Radio(value: 3, groupValue: 1, onChanged: (_) {}),
          ),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
