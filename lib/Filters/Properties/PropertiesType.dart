import 'package:flutter/material.dart';

class PropertyTypeFilter extends StatefulWidget {
  final Function(String) onApply;

  const PropertyTypeFilter({super.key, required this.onApply});

  @override
  _PropertyTypeFilterState createState() => _PropertyTypeFilterState();
}

class _PropertyTypeFilterState extends State<PropertyTypeFilter> {
  String selectedPropertyType = "Residential";

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
          const Text(
            "Filter by Property Type",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          RadioListTile(
            value: "Residential",
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
            groupValue: selectedPropertyType,
            onChanged: (value) {
              setState(() {
                selectedPropertyType = value!;
              });
            },
            title: const Text("Residential"),
          ),
          RadioListTile(
            value: "Commercial",
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
            groupValue: selectedPropertyType,
            onChanged: (value) {
              setState(() {
                selectedPropertyType = value!;
              });
            },
            title: const Text("Commercial"),
          ),
          RadioListTile(
            value: "Industrial",
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
            groupValue: selectedPropertyType,
            onChanged: (value) {
              setState(() {
                selectedPropertyType = value!;
              });
            },
            title: const Text("Industrial"),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                widget.onApply(selectedPropertyType);
                Navigator.pop(context);
              },
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
