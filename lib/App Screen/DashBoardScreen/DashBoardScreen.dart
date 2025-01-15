import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Notifications/NotificationScreen.dart';
import 'package:private_property_management/Models/CardModel.dart';
import 'package:private_property_management/Widgest/DashBoardCard.dart';

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
      CardModel(
        title: "Maintenance Requests",
        value: "52",
        iconPath: 'assets/icons/4.png',
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
              const SizedBox(height: 14),
              // Cards Section
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // Main Card
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: DashboardCard(cardModel: mainCard),
                      ),
                      const SizedBox(height: 20),
                      // Grid Cards
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap:
                            true, // Ensures GridView takes only needed space
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: gridCards.length,
                        itemBuilder: (context, index) {
                          return DashboardCard(cardModel: gridCards[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
