// import 'package:flutter/material.dart';

// class PropertyTypeFilter extends StatefulWidget {
//   const PropertyTypeFilter({super.key});

//   @override
//   State<PropertyTypeFilter> createState() => _PropertyTypeFilterState();
// }

// class _PropertyTypeFilterState extends State<PropertyTypeFilter> {
//   String? _selectedType = "Residential";

//   @override
//   Widget build(BuildContext context) {
//     return _buildPopup(
//       context: context,
//       title: "Select Property Type",
//       options: ["Residential", "Commercial", "Mixed Used"],
//       onApply: () {
//         // Handle filter logic with _selectedType
//         Navigator.pop(context);
//       },
//     );
//   }

//   Widget _buildPopup({
//     required BuildContext context,
//     required String title,
//     required List<String> options,
//     required VoidCallback onApply,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                   fontSize: 18,
//                   color: Color.fromRGBO(37, 43, 92, 1),
//                   fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 19),
//             Column(
//               children: options.map((option) {
//                 return RadioListTile<String>(
//                   value: option,
//                   groupValue: _selectedType,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedType = value;
//                     });
//                   },
//                   activeColor: const Color.fromRGBO(139, 200, 63, 1),
//                   title: Text(
//                     option,
//                     style: const TextStyle(
//                         fontSize: 14,
//                         color: Color.fromRGBO(37, 43, 92, 1),
//                         fontWeight: FontWeight.w500),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 12),
//             Center(
//               child: Container(
//                 height: 48,
//                 width: MediaQuery.of(context).size.width - 96,
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(139, 200, 63, 1),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Center(
//                   child: Text("Apply",
//                       style: TextStyle(fontSize: 16, color: Colors.white)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PropertyTypeFilter extends StatefulWidget {
  const PropertyTypeFilter({super.key});

  @override
  State<PropertyTypeFilter> createState() => _PropertyTypeFilterState();
}

class _PropertyTypeFilterState extends State<PropertyTypeFilter> {
  String? _selectedType = "Residential";

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
            "Select Property Type",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // Radio Options
          _buildRadioOption("Residential"),
          _buildRadioOption("Commercial"),
          _buildRadioOption("Mixed Used"),

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
