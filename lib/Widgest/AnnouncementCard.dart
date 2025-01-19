// import 'package:flutter/material.dart';
// import 'package:private_property_management/Models/AnnouncementModel.dart';

// class AnnouncementCard extends StatelessWidget {
//   final AnnouncementModel announcement;

//   const AnnouncementCard({Key? key, required this.announcement})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color.fromRGBO(245, 244, 248, 1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 announcement.title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   color: Color.fromRGBO(37, 43, 92, 1),
//                 ),
//               ),
//               Text(
//                 "Date: ${announcement.date}",
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(83, 88, 122, 1),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             announcement.description,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: Color.fromRGBO(83, 88, 122, 1),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:private_property_management/Models/AnnouncementModel.dart';

class AnnouncementCard extends StatelessWidget {
  final AnnouncementModel announcement;

  const AnnouncementCard({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(16, 15, 12, 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                announcement.propertyName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              // Date
              Text(
                "Date: ${announcement.date}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(83, 88, 122, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Description
          Text(
            announcement.description,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
