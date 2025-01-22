import 'package:flutter/material.dart';

class Progressstatusfilter extends StatefulWidget {
  final Function(String) onApply;

  const Progressstatusfilter({super.key, required this.onApply});

  @override
  _ProgressstatusfilterState createState() => _ProgressstatusfilterState();
}

class _ProgressstatusfilterState extends State<Progressstatusfilter> {
  String selectedProgressStatus = "Open";

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
            "Progress Status",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // Radio Options
          RadioListTile(
            value: "Open",
            groupValue: selectedProgressStatus,
            onChanged: (value) {
              setState(() {
                selectedProgressStatus = value!;
              });
            },
            title: const Text("Open"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),
          RadioListTile(
            value: "In Progress",
            groupValue: selectedProgressStatus,
            onChanged: (value) {
              setState(() {
                selectedProgressStatus = value!;
              });
            },
            title: const Text("In Progress"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),
          RadioListTile(
            value: "Resolved",
            groupValue: selectedProgressStatus,
            onChanged: (value) {
              setState(() {
                selectedProgressStatus = value!;
              });
            },
            title: const Text("Resolved"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),

          const SizedBox(height: 20),

          // Apply Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(selectedProgressStatus);
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
