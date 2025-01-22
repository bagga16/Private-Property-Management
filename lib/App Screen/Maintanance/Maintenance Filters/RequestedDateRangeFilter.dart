import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Requesteddaterangefilter extends StatelessWidget {
  final Function(DateTime, DateTime) onApply;

  const Requesteddaterangefilter({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fromController = TextEditingController();
    final TextEditingController toController = TextEditingController();

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
            "Requested Date Range",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // From Date Input
          TextField(
            controller: fromController,
            readOnly: true,
            decoration: const InputDecoration(
              hintText: "From (dd/MM/yyyy)",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000), // Set the earliest date selectable
                lastDate: DateTime(2100), // Set the latest date selectable
              );
              if (pickedDate != null) {
                fromController.text =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
              }
            },
          ),
          const SizedBox(height: 12),

          // To Date Input
          TextField(
            controller: toController,
            readOnly: true,
            decoration: const InputDecoration(
              hintText: "To (dd/MM/yyyy)",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000), // Set the earliest date selectable
                lastDate: DateTime(2100), // Set the latest date selectable
              );
              if (pickedDate != null) {
                toController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
              }
            },
          ),

          const SizedBox(height: 20),

          // Apply Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (fromController.text.isNotEmpty &&
                    toController.text.isNotEmpty) {
                  final fromDate =
                      DateFormat('dd/MM/yyyy').parse(fromController.text);
                  final toDate =
                      DateFormat('dd/MM/yyyy').parse(toController.text);

                  onApply(fromDate, toDate);
                }
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
