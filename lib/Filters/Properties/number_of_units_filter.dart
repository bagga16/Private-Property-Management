import 'package:flutter/material.dart';

class NumberOfUnitsFilter extends StatefulWidget {
  const NumberOfUnitsFilter({super.key});

  @override
  State<NumberOfUnitsFilter> createState() => _NumberOfUnitsFilterState();
}

class _NumberOfUnitsFilterState extends State<NumberOfUnitsFilter> {
  String? _selectedUnits = "10"; // Default selected option
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              "Number Of Units",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            const SizedBox(height: 16),

            // Radio Button Rows
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: _buildRadioOption("10")),
                    Flexible(child: _buildRadioOption("20")),
                    Flexible(child: _buildRadioOption("Above 20")),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _buildRadioOption("Below 20")),
                    Flexible(child: _buildRadioOption("Manually")),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // TextFields for Manual Range (if manually selected)
            if (_selectedUnits == "Manually") _buildManualRangeInputs(),

            const SizedBox(height: 16),

            // Apply Button
            Center(
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Apply Button logic
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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a single radio option
  Widget _buildRadioOption(String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUnits = value;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Radio<String>(
            value: value,
            groupValue: _selectedUnits,
            activeColor: const Color.fromRGBO(139, 200, 63, 1),
            onChanged: (val) {
              setState(() {
                _selectedUnits = val;
              });
            },
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for manual range inputs
  Widget _buildManualRangeInputs() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 244, 248, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _fromController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "From",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(115, 115, 115, 1),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 244, 248, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _toController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "To",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(115, 115, 115, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
