// import 'package:flutter/material.dart';
// import 'package:private_property_management/Models/PropertyModel.dart';
// import 'package:private_property_management/Models/WorkerModel.dart';
// import 'package:private_property_management/Widgest/PropertyCard.dart';

// class WorkerDetailsScreen extends StatefulWidget {
//   final WorkerModel worker;

//   const WorkerDetailsScreen({
//     super.key,
//     required this.worker,
//   });

//   @override
//   State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
// }

// class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
//   List<PropertyModel> properties = [
//     PropertyModel(
//       title: "Sky Dandelions",
//       id: "1163213",
//       address: "Street, City, State, Zip Code, Country",
//       type: "Residential",
//       units: 20,
//       description:
//           "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
//       createdDate: "20/01/2024",
//       updatedDate: "20/01/2024",
//       status: "Active",
//       imagePath: '',
//     ),
//     PropertyModel(
//       title: "Blue Horizon",
//       id: "1163214",
//       address: "Street, City, State, Zip Code, Country",
//       type: "Residential",
//       units: 10,
//       description:
//           "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
//       createdDate: "20/01/2024",
//       updatedDate: "20/01/2024",
//       status: "Active",
//       imagePath: '',
//     ),
//     PropertyModel(
//       title: "Blue Horizon",
//       id: "1163214",
//       address: "Street, City, State, Zip Code, Country",
//       type: "Residential",
//       units: 10,
//       description:
//           "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
//       createdDate: "20/01/2024",
//       updatedDate: "20/01/2024",
//       status: "Active",
//       imagePath: '',
//     ),
//   ];

//   void _deleteProperty(int index) {
//     setState(() {
//       properties.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                       child: Icon(Icons.arrow_back_ios_new,
//                           color: Color.fromRGBO(37, 43, 92, 1), size: 18),
//                     ),
//                   ),
//                   const Text(
//                     "Worker Details",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                   ),
//                   GestureDetector(
//                     // onTap: () {
//                     //   Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => const (),
//                     //     ),
//                     //   );
//                     // },
//                     child: const CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Color.fromRGBO(37, 43, 92, 1),
// child: Image(
//   image: AssetImage('assets/icons/edditProfile.png'),
// ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 35),
//               Text(
//                 widget.worker.name,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(37, 43, 92, 1),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               RichText(
//                 text: TextSpan(
//                   text: 'Worker ID: ',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight:
//                         FontWeight.w600, // Larger font size for "Created:"
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: '${widget.worker.id}',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight:
//                             FontWeight.w400, // Larger font size for "Created:"
//                         color: Color.fromRGBO(83, 88, 122, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(Icons.email,
//                       size: 14, color: Color.fromRGBO(139, 200, 63, 1)),
//                   const SizedBox(width: 4),
//                   Text(
//                     widget.worker.email,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(Icons.phone,
//                       size: 14, color: Color.fromRGBO(139, 200, 63, 1)),
//                   const SizedBox(width: 4),
//                   Text(
//                     widget.worker.phone,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 22),
//               RichText(
//                 text: TextSpan(
//                   text: 'Created: ',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight:
//                         FontWeight.w600, // Larger font size for "Created:"
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: widget.worker.createdDate,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight:
//                             FontWeight.w400, // Larger font size for "Created:"
//                         color: Color.fromRGBO(83, 88, 122, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8),
//               RichText(
//                 text: TextSpan(
//                   text: 'Updated: ',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight:
//                         FontWeight.w600, // Larger font size for "Created:"
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: widget.worker.updatedDate,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight:
//                             FontWeight.w400, // Larger font size for "Created:"
//                         color: Color.fromRGBO(83, 88, 122, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 38),
//               const Text(
//                 "Assign Properties",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                   color: Color.fromRGBO(37, 43, 92, 1),
//                 ),
//               ),
// const SizedBox(height: 16),
// Container(
//   padding:
//       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//   decoration: BoxDecoration(
//     color: const Color.fromRGBO(245, 244, 248, 1),
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: const Row(
//     children: [
//       Expanded(
//         child: Text(
//           "Search Property To Assign",
//           style: TextStyle(
//               fontSize: 12,
//               height: 2,
//               color: Color.fromRGBO(37, 43, 92, 1)),
//         ),
//       ),
//       Icon(Icons.search, color: Color.fromRGBO(37, 43, 92, 1)),
//     ],
//   ),
// ),
// const SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: properties.length,
//                   itemBuilder: (context, index) {
//                     final property = properties[index];
//                     return Dismissible(
//                         key: Key(property.id),
//                         direction: DismissDirection.endToStart,
//                         background: Container(
//                           alignment: Alignment.centerRight,
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromRGBO(35, 79, 104, 1),
//                           ),
//                           child: const Icon(Icons.delete,
//                               color: Colors.white, size: 32),
//                         ),
//                         onDismissed: (direction) {
//                           _deleteProperty(index);
//                         },
//                         child: PropertyCard(property: property));
//                   },
//                 ),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/App%20Screen/Proprties/Workers/EditWorkerScreen.dart';
import 'package:private_property_management/Controllers/WorkerControllrs/WrokersDetailsController.dart';
import 'package:private_property_management/Models/WorkerModel.dart';
import 'package:private_property_management/Widgest/PropertyCard.dart';
import 'package:private_property_management/Widgest/WorkerPropertyCard.dart';

class WorkerDetailsScreen extends StatelessWidget {
  final WorkerModel worker;
  final WorkerDetailsController _controller =
      Get.put(WorkerDetailsController());

  WorkerDetailsScreen({Key? key, required this.worker}) : super(key: key) {
    // Load worker's properties
    _controller.loadWorkerProperties(worker.properties);
  }
  // Format date as DD/MM/YYYY
  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Worker Details",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => EditWorkerScreen(
                            workerDocumentId: worker.id,
                            workerData: {},
                          ));
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Image(
                        image: AssetImage('assets/icons/edditProfile.png'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),

              // Worker Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    worker.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  Text(
                    worker.role,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(139, 200, 63, 1)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  text: 'Worker ID: ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: '${worker.id}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Email and Phone
              Row(
                children: [
                  const Icon(Icons.email,
                      size: 14, color: Color.fromRGBO(139, 200, 63, 1)),
                  const SizedBox(width: 4),
                  Text(
                    worker.email,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone,
                      size: 14, color: Color.fromRGBO(139, 200, 63, 1)),
                  const SizedBox(width: 4),
                  Text(
                    worker.phone,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // Created and Updated Dates
              RichText(
                text: TextSpan(
                  text: 'Created: ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: formatDate(worker.createdDate),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Updated: ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: worker.updatedDate.isNotEmpty
                          ? formatDate(worker.updatedDate)
                          : formatDate(worker.createdDate),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 38),

              // Assigned Properties Section
              const Text(
                "Assigned Properties",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 244, 248, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Search Properties Assigned",
                        style: TextStyle(
                            fontSize: 12,
                            height: 2,
                            color: Color.fromRGBO(37, 43, 92, 1)),
                      ),
                    ),
                    Icon(Icons.search,
                        size: 22, color: Color.fromRGBO(37, 43, 92, 1)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Obx(() {
                  if (_controller.assignedProperties.isEmpty) {
                    return const Center(
                      child: Text("No assigned properties."),
                    );
                  }

                  return ListView.builder(
                    itemCount: _controller.assignedProperties.length,
                    itemBuilder: (context, index) {
                      final property = _controller.assignedProperties[index];
                      return Workerpropertycard(
                        property: property,
                        isSelected: false,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
