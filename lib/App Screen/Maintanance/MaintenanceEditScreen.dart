// import 'package:flutter/material.dart';

// class MaintenanceEditScreen extends StatelessWidget {
//   final Map<String, dynamic> request;

//   const MaintenanceEditScreen({super.key, required this.request});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController priorityController =
//         TextEditingController(text: request['priority']);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Edit Maintenance",
//           style: TextStyle(color: Color(0xFF252B5C)),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Color(0xFF252B5C)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: priorityController,
//               decoration: const InputDecoration(labelText: "Priority"),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF8BC83F),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               onPressed: () {
//                 // Handle Update Logic
//                 Navigator.pop(context);
//               },
//               child: const Center(
//                 child: Text(
//                   "Update",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
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
import 'package:private_property_management/Widgest/CustomTextField.dart';
import 'MaintenanceEditScreen.dart';

class MaintenanceEditScreen extends StatelessWidget {
  final Map<String, dynamic> request;

  const MaintenanceEditScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final TextEditingController priorityController =
        TextEditingController(text: request['priority']);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                      ),
                    ),
                    const Text(
                      "Maintenance  Details",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    Text("        "),
                  ],
                ),
                const SizedBox(height: 12),

                // Image
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/maintenance.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 9),

                // ID & Description
                Text(
                  "Requested ID# ${request['id'] ?? 'N/A'}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF252B5C),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary. This apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF53587A),
                  ),
                ),
                const SizedBox(height: 8),

                // Details Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Unit ID: ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                        children: [
                          TextSpan(
                            text: request['tenantId'] ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Tenant ID: ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                        children: [
                          TextSpan(
                            text: request['tenantId'] ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Priority: ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                        children: [
                          TextSpan(
                            text: request['priority'] ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  height: 48,
                  hintText: "Priority Status",
                ),
                const SizedBox(height: 12),
                const CustomTextField(height: 48, hintText: "Progress Status"),
                const SizedBox(height: 12),
                const CustomTextField(height: 48, hintText: "Assigned To"),

                const SizedBox(height: 32),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 96,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
