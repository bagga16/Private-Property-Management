import 'package:flutter/material.dart';

class Assignedtofilter extends StatefulWidget {
  const Assignedtofilter({super.key});

  @override
  State<Assignedtofilter> createState() => _AssignedtofilterState();
}

class _AssignedtofilterState extends State<Assignedtofilter> {
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
            "Assigned To",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 50),

          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 244, 248, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Assigned To",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),

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
                  //minimumSize: const Size(double.infinity, 48),
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
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
