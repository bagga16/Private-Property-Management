import 'package:flutter/material.dart';

class PropertyStatusFilter extends StatefulWidget {
  final Function(String) onApply;

  const PropertyStatusFilter({super.key, required this.onApply});

  @override
  _PropertyStatusFilterState createState() => _PropertyStatusFilterState();
}

class _PropertyStatusFilterState extends State<PropertyStatusFilter> {
  String selectedPropertyStatus = "Active";

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
            value: "Active",
            groupValue: selectedPropertyStatus,
            onChanged: (value) {
              setState(() {
                selectedPropertyStatus = value!;
              });
            },
            title: const Text("Active"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),

          RadioListTile(
            value: "In-Active",
            groupValue: selectedPropertyStatus,
            onChanged: (value) {
              setState(() {
                selectedPropertyStatus = value!;
              });
            },
            title: const Text("In-Active"),
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
          ),

          const SizedBox(height: 20),

          // Apply Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(selectedPropertyStatus);
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
