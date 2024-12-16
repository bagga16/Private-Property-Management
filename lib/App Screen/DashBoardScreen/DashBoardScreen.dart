import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Notifications/NotificationScreen.dart';
import 'package:private_property_management/Models/CardModel.dart';
import 'package:private_property_management/Widgest/DashBoardCard.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for the cards
//     final List<CardModel> cards = [
//       CardModel(
//         title: "Monthly Income",
//         value: "\$24.2",
//         iconPath: 'assets/icons/1.png',
//       ),
//       CardModel(
//         title: "Payments",
//         value: "52",
//         iconPath: 'assets/icons/2.png',
//       ),
//       CardModel(
//         title: "Lease Expirations",
//         value: "52",
//         iconPath: 'assets/icons/3.png',
//       ),
//       CardModel(
//         title: "Maintenance Requests",
//         value: "52",
//         iconPath: 'assets/icons/4.png',
//       ),
//     ];
//     final CardModel mainCard = CardModel(
//       title: "Monthly Income",
//       value: "\$24,527.00",
//       iconPath: 'assets/icons/1.png',
//     );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 26),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 22,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: AssetImage(
//                             'assets/images/user.png'), // Profile image
//                       ),
//                       SizedBox(width: 8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Manager",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Color.fromRGBO(115, 115, 115, 1),
//                             ),
//                           ),
//                           Text(
//                             "Big Mike",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const CircleAvatar(
//                     backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                     radius: 20,
//                     child: Icon(
//                       Icons.notifications,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Cards Section
//               Row(
//                 children: [
//                   // SizedBox(
//                   //   height: 180,
//                   //   width: double.infinity,
//                   //   child: DashboardCard(cardModel: mainCard),
//                   // ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                   ),
//                   itemCount: cards.length,
//                   itemBuilder: (context, index) {
//                     return DashboardCard(cardModel: cards[index]);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // Card data
    final List<CardModel> gridCards = [
      CardModel(
        title: "Payments",
        value: "52",
        iconPath: 'assets/icons/2.png',
      ),
      CardModel(
        title: "Lease Expirations",
        value: "52",
        iconPath: 'assets/icons/3.png',
      ),
      CardModel(
        title: "Maintenance Requests",
        value: "52",
        iconPath: 'assets/icons/4.png',
      ),
    ];

    final CardModel mainCard = CardModel(
      title: "Monthly Income",
      value: "\$24,527.00",
      iconPath: 'assets/icons/1.png',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              // Profile Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/images/user.png'), // Profile image
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Manager",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(115, 115, 115, 1),
                            ),
                          ),
                          Text(
                            "Big Mike",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      radius: 20,
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromRGBO(139, 200, 63, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Main Card
              SizedBox(
                height: 180,
                width: double.infinity,
                child: DashboardCard(cardModel: mainCard),
              ),
              const SizedBox(height: 16),
              // Grid Cards
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: gridCards.length,
                  itemBuilder: (context, index) {
                    return DashboardCard(cardModel: gridCards[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
