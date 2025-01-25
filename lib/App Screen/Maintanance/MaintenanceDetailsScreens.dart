// import 'package:flutter/material.dart';
// import 'MaintenanceEditScreen.dart';

// class MaintenanceDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> request;

//   const MaintenanceDetailsScreen({super.key, required this.request});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: const CircleAvatar(
//                         radius: 22,
//                         backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                         child: Icon(Icons.arrow_back_ios_new,
//                             color: Color.fromRGBO(37, 43, 92, 1), size: 18),
//                       ),
//                     ),
//                     const Text(
//                       "Maintenance  Details",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         color: Color.fromRGBO(37, 43, 92, 1),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MaintenanceEditScreen(
//                               request: request,
//                             ),
//                           ),
//                         );
//                       },
//                       child: const CircleAvatar(
//                         radius: 22,
//                         backgroundColor: Color.fromRGBO(37, 43, 92, 1),
//                         child: Image(
//                             image: AssetImage('assets/icons/edditProfile.png')),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 12),

//                 // Image
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: const DecorationImage(
//                       image: AssetImage('assets/images/maintenance.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 9),

//                 // ID & Description
//                 Text(
//                   "Requested ID# ${request['id'] ?? 'N/A'}",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Color.fromRGBO(37, 43, 92, 1),
//                   ),
//                 ),
// const SizedBox(height: 10),
// const Text(
//   "Description",
//   style: TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.w400,
//     color: Color(0xFF252B5C),
//   ),
// ),
// const SizedBox(height: 4),
// const Text(
//   "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary. This apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
//   style: TextStyle(
//     fontSize: 13.5,
//     fontWeight: FontWeight.w400,
//     color: Color(0xFF53587A),
//   ),
// ),
// const SizedBox(height: 38),

//                 // Details Grid
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: 'Requested: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['requestedDate'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Assigned to: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['tenantId'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: 'Priority: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['priority'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Status: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['status'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: 'Created: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['requestedDate'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         text: 'Updated: ',
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                         children: [
//                           TextSpan(
//                             text: request['resolvedDate'] ?? 'N/A',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(83, 88, 122, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailItem(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Color(0xFF252B5C),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceEditScreen.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

class MaintenanceDetailsScreen extends StatelessWidget {
  final MaintenanceRequestModel request;

  const MaintenanceDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/maintenance-edit-screen',
                        arguments: request,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Image(
                          image: AssetImage('assets/icons/edditProfile.png')),
                    ),
                  ),
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
              // Request Info
              Text(
                "Requested ID#  ${request.id.substring(0, 6)}",
                style: const TextStyle(
                  fontSize: 18,
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
              const SizedBox(height: 38),

              // Details Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Requested: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.requestedDate,
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
                      text: 'Assigned to: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.assignedTo,
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
                          text: request.priority,
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
                      text: 'Status: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.status,
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Created: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.requestedDate,
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
                      text: 'Updated: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.resolvedDate,
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
            ],
          ),
        ),
      ),
    );
  }
}
