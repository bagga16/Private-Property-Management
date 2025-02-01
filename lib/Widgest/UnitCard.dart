// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import '../Models/UnitModel.dart';

// class UnitCard extends StatelessWidget {
//   final UnitModel unit;
//   final VoidCallback onTap;

//   const UnitCard({super.key, required this.unit, required this.onTap});
//   String formatDate(String date) {
//     final dateTime = DateTime.parse(date);
//     return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     Uint8List? decodedImage;
//     try {
//       if (unit.imagePath.isNotEmpty) {
//         decodedImage = base64Decode(unit.imagePath);
//       }
//     } catch (e) {
//       print("Error decoding image for unit: ${unit.unitId}");
//     }
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.all(016),
//         decoration: BoxDecoration(
//           color: const Color.fromRGBO(245, 244, 248, 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: decodedImage != null
//                   ? Image.memory(decodedImage,
//                       height: 150, width: double.infinity, fit: BoxFit.fill)
//                   : Image.asset('assets/placeholder.png', height: 150),
//             ),
//             const SizedBox(height: 18),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: unit.unitName,
//                     style: const TextStyle(
//                       fontSize: 12.5,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "  (ID: ${unit.unitId.substring(0, 7)})",
//                         style: const TextStyle(
//                           fontSize: 9,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       unit.rentAmount,
//                       style: const TextStyle(
//                           fontSize: 12.5,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(139, 200, 63, 1)),
//                     ),
//                     const Text(
//                       "month",
//                       style: TextStyle(
//                           fontSize: 6.5,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromRGBO(139, 200, 63, 1)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Unit ID: ${unit.unitId.substring(0, 7)}",
//                   style: const TextStyle(
//                     fontSize: 9,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                 ),
//                 Text(
//                   "Property ID: ${unit.propertyId.substring(0, 7)}",
//                   style: const TextStyle(
//                     fontSize: 9,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 7),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   unit.area,
//                   style: const TextStyle(
//                     fontSize: 9,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                 ),
//                 Text(
//                   unit.status,
//                   style: TextStyle(
//                       fontSize: 9,
//                       fontWeight: FontWeight.w500,
//                       color: unit.status == "Occupied"
//                           ? const Color.fromRGBO(158, 0, 0, 1)
//                           : unit.status == "Vacant"
//                               ? const Color.fromRGBO(0, 158, 61, 1)
//                               : const Color.fromRGBO(0, 21, 188, 1)),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 9),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: "Created:  ",
//                     style: const TextStyle(
//                       fontSize: 9.2,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(83, 88, 122, 1),
//                     ),
//                     children: [
//                       TextSpan(
//                         text: formatDate(unit.createdDate),
//                         style: const TextStyle(
//                           fontSize: 9.2,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: "Updated:  ",
//                     style: const TextStyle(
//                       fontSize: 9.2,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(83, 88, 122, 1),
//                     ),
//                     children: [
//                       TextSpan(
//                         text: formatDate(unit.updatedDate),
//                         style: const TextStyle(
//                           fontSize: 9.2,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../Models/UnitModel.dart';

class UnitCard extends StatelessWidget {
  final UnitModel unit;
  final VoidCallback onTap;

  const UnitCard({super.key, required this.unit, required this.onTap});

  String formatDate(String date) {
    final dateTime = DateTime.parse(date);
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? decodedImage;
    try {
      if (unit.imageRefs.isNotEmpty && unit.imageRefs.first.isNotEmpty) {
        decodedImage = base64Decode(unit.imageRefs.first);
      }
    } catch (e) {
      print("Error decoding image for unit: ${unit.unitId}");
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: decodedImage != null
                    ? Image.memory(decodedImage,
                        height: 150, width: double.infinity, fit: BoxFit.fill)
                    : const SizedBox(
                        height: 150,
                        child: Center(child: Text("No Image Available")),
                      )),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: unit.unitName,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "  (ID: ${unit.unitId.substring(0, 7)})",
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$${unit.rentAmount}",
                      style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(139, 200, 63, 1)),
                    ),
                    const Text(
                      " / month",
                      style: TextStyle(
                          fontSize: 6.5,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(139, 200, 63, 1)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Unit ID: ${unit.unitId.substring(0, 7)}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                Text(
                  "Property ID: ${unit.propertyId.substring(0, 7)}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  unit.area,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                Text(
                  unit.status,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: unit.status == "Occupied"
                          ? const Color.fromRGBO(158, 0, 0, 1)
                          : unit.status == "Vacant"
                              ? const Color.fromRGBO(0, 158, 61, 1)
                              : const Color.fromRGBO(0, 21, 188, 1)),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Created:  ",
                    style: const TextStyle(
                      fontSize: 9.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: formatDate(unit.createdDate),
                        style: const TextStyle(
                          fontSize: 9.2,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Updated:  ",
                    style: const TextStyle(
                      fontSize: 9.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: formatDate(unit.updatedDate),
                        style: const TextStyle(
                          fontSize: 9.2,
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
    );
  }
}
