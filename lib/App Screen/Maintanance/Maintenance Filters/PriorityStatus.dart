import 'package:flutter/material.dart';

class PrioritystatusFilter extends StatefulWidget {
  final Function(String) onApply;

  const PrioritystatusFilter({super.key, required this.onApply});

  @override
  _PrioritystatusFilterState createState() => _PrioritystatusFilterState();
}

class _PrioritystatusFilterState extends State<PrioritystatusFilter> {
  String selectedPriorityStatus = "Open";

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
          RadioListTile(
            value: "Low",
            groupValue: selectedPriorityStatus,
            onChanged: (value) {
              setState(() {
                selectedPriorityStatus = value!;
              });
            },
            title: const Text("Low"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),
          RadioListTile(
            value: "Medium",
            groupValue: selectedPriorityStatus,
            onChanged: (value) {
              setState(() {
                selectedPriorityStatus = value!;
              });
            },
            title: const Text("Medium"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),
          RadioListTile(
            value: "High",
            groupValue: selectedPriorityStatus,
            onChanged: (value) {
              setState(() {
                selectedPriorityStatus = value!;
              });
            },
            title: const Text("High"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),

          const SizedBox(height: 20),

          // Apply Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(selectedPriorityStatus);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
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
        ],
      ),
    );
  }
}
