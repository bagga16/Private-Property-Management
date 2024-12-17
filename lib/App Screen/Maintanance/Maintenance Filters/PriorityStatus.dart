import 'package:flutter/material.dart';

class Prioritystatus extends StatefulWidget {
  const Prioritystatus({super.key});

  @override
  State<Prioritystatus> createState() => _PrioritystatusState();
}

class _PrioritystatusState extends State<Prioritystatus> {
  String? _selectedType = "Low";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            "Priority Status",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // Radio Options
          _buildRadioOption("Low"),
          _buildRadioOption("Medium"),
          _buildRadioOption("High"),

          const SizedBox(height: 45),

          // Apply Button
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 160,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                  // minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedType,
      onChanged: (val) {
        setState(() {
          _selectedType = val;
        });
      },
      activeColor: const Color.fromRGBO(139, 200, 63, 1),
      title: Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(37, 43, 92, 1),
        ),
      ),
    );
  }
}
