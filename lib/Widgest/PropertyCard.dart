// import 'package:flutter/material.dart';
// import 'package:private_property_management/Models/PropertyModel.dart';

// class PropertyCard extends StatelessWidget {
//   final PropertyModel property;
//   final VoidCallback? onTap;

//   const PropertyCard({super.key, required this.property, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//         decoration: BoxDecoration(
//           color: const Color.fromRGBO(245, 244, 248, 1),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title and Status
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   property.title,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w700,
//                     color: Color.fromRGBO(37, 43, 92, 1),
//                   ),
//                 ),
//                 Container(
//                   height: 24,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: property.status == "Active"
//                         ? const Color.fromRGBO(0, 158, 61, 1)
//                         : const Color.fromRGBO(158, 0, 0, 1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     property.status,
//                     style: const TextStyle(
//                       fontSize: 9,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 5),
//             // Address
//             Row(
//               children: [
//                 Text(
//                   "ID:${property.id}  ",
//                   style: const TextStyle(
//                     fontSize: 9,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.location_on,
//                       size: 14,
//                       color: Color.fromRGBO(139, 200, 63, 1),
//                     ),
//                     Text(
//                       property.address,
//                       style: const TextStyle(
//                         fontSize: 9,
//                         fontWeight: FontWeight.w400,
//                         color: Color.fromRGBO(83, 88, 122, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 7),

//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "${property.type}  ", // Property type text
//                     style: const TextStyle(
//                       fontSize: 9,
//                       fontWeight: FontWeight.w400,
//                       color: Color.fromRGBO(83, 88, 122, 1),
//                     ),
//                   ),
//                   TextSpan(
//                     text: "Units: ${property.units}", // Units text
//                     style: const TextStyle(
//                       fontSize: 9,
//                       fontWeight:
//                           FontWeight.w600, // Bold or semi-bold for emphasis
//                       color: Color.fromRGBO(83, 88, 122, 1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 7),
//             // Description
//             Text(
//               property.description,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 9,
//                 fontWeight: FontWeight.w400,
//                 color: Color.fromRGBO(83, 88, 122, 1),
//               ),
//             ),
//             const SizedBox(height: 14),
//             // Created and Updated
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       const TextSpan(
//                         text: "Created: ", // Property type text
//                         style: TextStyle(
//                           fontSize: 9,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                       TextSpan(
//                         text: property.createdDate, // Units text
//                         style: const TextStyle(
//                           fontSize: 9,
//                           fontWeight:
//                               FontWeight.w400, // Bold or semi-bold for emphasis
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       const TextSpan(
//                         text: "Updated: ", // Property type text
//                         style: TextStyle(
//                           fontSize: 9,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                       TextSpan(
//                         text: property.updatedDate, // Units text
//                         style: const TextStyle(
//                           fontSize: 9,
//                           fontWeight:
//                               FontWeight.w400, // Bold or semi-bold for emphasis
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
import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback? onTap;

  const PropertyCard({super.key, required this.property, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  property.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              // Content Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: property.status == "Active"
                              ? const Color.fromRGBO(0, 158, 61, 1)
                              : const Color.fromRGBO(158, 0, 0, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          property.status,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Address
                  Row(
                    children: [
                      Text(
                        "ID:${property.id}  ",
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Color.fromRGBO(139, 200, 63, 1),
                          ),
                          Text(
                            property.address,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${property.type}  ", // Property type text
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                        TextSpan(
                          text: "Units: ${property.units}", // Units text
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600, // Emphasis
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),

                  // Description
                  Text(
                    property.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Created and Updated
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Created: ", // Created text
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                            TextSpan(
                              text: property.createdDate, // Created date
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Updated: ", // Updated text
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                            TextSpan(
                              text: property.updatedDate, // Updated date
                              style: const TextStyle(
                                fontSize: 9,
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
            ],
          ),
        ),
      ),
    );
  }
}
