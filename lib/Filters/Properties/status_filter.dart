import 'package:flutter/material.dart';

class StatusFilter extends StatefulWidget {
  const StatusFilter({super.key});

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends State<StatusFilter> {
  String? _selectedStatus = "Active";

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
            "Search By Status",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // Radio Options
          _buildRadioOption("Active"),
          _buildRadioOption("In-Active"),

          const SizedBox(height: 16),

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
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedStatus,
      onChanged: (val) {
        setState(() {
          _selectedStatus = val;
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
