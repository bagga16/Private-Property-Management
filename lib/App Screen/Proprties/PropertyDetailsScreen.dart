// import 'package:flutter/material.dart';

// class PropertyDetailsScreen extends StatelessWidget {
//   const PropertyDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 24),
//             // Custom Header Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const CircleAvatar(
//                     radius: 22,
//                     backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                     child: Icon(Icons.arrow_back_ios_new,
//                         color: Color.fromRGBO(37, 43, 92, 1), size: 18),
//                   ),
//                 ),
//                 const Text(
//                   "Property Details",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                     color: Color.fromRGBO(37, 43, 92, 1),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const AddPropertyScreen(),
//                     //   ),
//                     // );
//                   },
//                   child: const CircleAvatar(
//                     radius: 22,
//                     backgroundColor: Color.fromRGBO(37, 43, 92, 1),
//                     child: Image(
//                         image: AssetImage('assets/icons/edditProfile.png')),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 45,
//             ),
//             const Text(
//               "Entire Bromo Mountain View Cabin in Surabaya",
//               style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w500,
//                 color: Color.fromRGBO(37, 43, 92, 1),
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Row(
//               children: const [
//                 Icon(Icons.location_on,
//                     size: 17, color: Color.fromRGBO(139, 200, 63, 1)),
//                 SizedBox(width: 2),
//                 Text(
//                   "Street, City, State, Zip Code, Country",
//                   style: TextStyle(
//                     fontSize: 13.5,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(83, 88, 122, 1),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 22),
//             const Text(
//               "Description",
//               style: TextStyle(
//                 fontSize: 19.5,
//                 fontWeight: FontWeight.w500,
//                 color: Color.fromRGBO(37, 43, 92, 1),
//               ),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary.\nThis apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
//               style: TextStyle(
//                 fontSize: 13.8,
//                 fontWeight: FontWeight.w400,
//                 color: Color.fromRGBO(115, 115, 115, 1),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               children: const [
//                 _PropertyDetailItem(label: "Property ID", value: "2655963"),
//                 _PropertyDetailItem(
//                     label: "Property Type", value: "Residential"),
//                 _PropertyDetailItem(label: "No. of Units", value: "40"),
//                 _PropertyDetailItem(label: "Status", value: "Active"),
//               ],
//             ),
//             const SizedBox(height: 28),
//             const Text(
//               "Payments Overview",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//                 color: Color.fromRGBO(37, 43, 92, 1),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 6.0),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 12),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(245, 244, 248, 1),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "John Martin",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w700,
//                                     color: Color.fromRGBO(37, 43, 92, 1),
//                                   ),
//                                 ),
//                                 Text(
//                                   "Payment Status: Overdue (7 Days)",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Text(
//                               "\$235/month",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color.fromRGBO(37, 43, 92, 1),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromRGBO(139, 200, 63, 1),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               child: const Text(
//                                 "Send Reminder",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             OutlinedButton(
//                               onPressed: () {},
//                               style: OutlinedButton.styleFrom(
//                                 side: const BorderSide(
//                                   color: Color.fromRGBO(37, 43, 92, 1),
//                                 ),
//                               ),
//                               child: const Text("View Details"),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PropertyDetailItem extends StatelessWidget {
//   final String label;
//   final String value;

//   const _PropertyDetailItem({
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const Icon(Icons.check_circle, color: Color.fromRGBO(139, 200, 63, 1)),
//         const SizedBox(width: 8),
//         Text(
//           "$label: $value",
//           style: const TextStyle(
//             fontSize: 14,
//             color: Color.fromRGBO(115, 115, 115, 1),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final PropertyModel property;

  const PropertyDetailsScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                    "Property Details",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AddPropertyScreen(),
                      //   ),
                      // );
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
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Entire Bromo Mountain View Cabin in Surabaya",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 17, color: Color.fromRGBO(139, 200, 63, 1)),
                  const SizedBox(width: 2),
                  const Text(
                    "Street, City, State, Zip Code, Country",
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary.\nThis apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
                style: TextStyle(
                  fontSize: 13.8,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(115, 115, 115, 1),
                ),
              ),
              const SizedBox(height: 16),
// Property Info Grid
              Container(
                child: Column(
                  children: [
                    _buildTwoColumnRow(
                      title1: "Property ID",
                      value1: property.id,
                      title2: "Property Type",
                      value2: property.type,
                    ),
                    const SizedBox(height: 22),
                    _buildTwoColumnRow(
                      title1: "No. of Units",
                      value1: property.units.toString(),
                      title2: "Status",
                      value2: property.status,
                    ),
                    const SizedBox(height: 22),
                    _buildTwoColumnRow(
                      title1: "Created",
                      value1: property.createdDate,
                      title2: "Updated",
                      value2: property.updatedDate,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Payments Overview
              const Text(
                "Payments Overview",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 12),

              // Payment Cards
              _buildPaymentCard(
                name: "John Martin",
                rent: "\$235/",
                statusLabel: "Over Due (7 Days)",
                statusColor: const Color.fromRGBO(223, 21, 37, 1),
                buttonText: "View Details",
                isDue: true,
              ),
              const SizedBox(height: 12),
              _buildPaymentCard(
                name: "John Martin",
                rent: "\$235/",
                statusLabel: "Due in (7 Days)",
                statusColor: const Color.fromRGBO(139, 200, 63, 1),
                buttonText: "View Details",
                isDue: false,
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // Two-column row for property info
  Widget _buildTwoColumnRow({
    required String title1,
    required String value1,
    required String title2,
    required String value2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildInfoItem(title1, value1),
        ),
        Expanded(
          child: _buildInfoItem(title2, value2),
        ),
      ],
    );
  }

  // Single info item
  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/point.png')),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(83, 88, 122, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ),
      ],
    );
  }

  // Widget for Payment Card
  Widget _buildPaymentCard({
    required String name,
    required String rent,
    required String statusLabel,
    required Color statusColor,
    required String buttonText,
    required bool isDue,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 11,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3.4, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 43, 92, 0.22),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Text(
                      "Former Tenant",
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    rent,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                  Text(
                    "month",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Status",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Unit: Apart 101",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Updated: 20/01/2024",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 39,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(35, 79, 104, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "View Details",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 39,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(35, 79, 104, 1),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Send Reminder",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(37, 43, 92, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
