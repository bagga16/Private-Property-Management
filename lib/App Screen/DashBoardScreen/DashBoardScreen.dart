import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Anouncements/AnouncementsScreen.dart';
import 'package:private_property_management/App%20Screen/Lease%20Details/LeaseDetails.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceScreen%20.dart';
import 'package:private_property_management/App%20Screen/Notifications/NotificationScreen.dart';
import 'package:private_property_management/App%20Screen/Payments/PaymentsScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitsListScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Workers/workers_list_screen.dart';
import 'package:private_property_management/Controllers/DashBoardController.dart';
import 'package:private_property_management/Models/CardModel.dart';
import 'package:private_property_management/Widgest/DashBoardCard.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
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
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: controller
                                        .profilePic.value.isNotEmpty
                                    ? MemoryImage(base64Decode(
                                        controller.profilePic.value))
                                    : const AssetImage('assets/images/user.png')
                                        as ImageProvider,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.userRole.value,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(115, 115, 115, 1),
                                    ),
                                  ),
                                  Text(
                                    controller.userName.value,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () =>
                                Get.to(() => const NotificationScreen()),
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
                              const SizedBox(height: 20),
                              // Main Card
                              SizedBox(
                                height: 180,
                                width: double.infinity,
                                child: DashboardCard(
                                  cardModel: CardModel(
                                    title: "Monthly Income",
                                    value: controller.monthlyIncome.value,
                                    iconPath: 'assets/icons/1.png',
                                    goToPath: DashboardScreen(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Grid Cards
                              GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 10,
                                ),
                                children: [
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Payments",
                                      value: controller.totalPayments.value
                                          .toString(),
                                      iconPath: 'assets/icons/2.png',
                                      goToPath: PaymentsScreen(),
                                    ),
                                  ),
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Lease Expirations",
                                      value: controller.totalLeases.value
                                          .toString(),
                                      iconPath: 'assets/icons/4.png',
                                      goToPath: LeaseDetailsScreen(),
                                    ),
                                  ),
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Maintenance Requests",
                                      value: controller
                                          .totalMaintenanceRequests.value
                                          .toString(),
                                      iconPath: 'assets/icons/3.png',
                                      goToPath: MaintenanceScreen(),
                                    ),
                                  ),
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Workers",
                                      value: controller.totalWorkers.value
                                          .toString(),
                                      iconPath: 'assets/icons/workers.png',
                                      goToPath: WorkersListScreen(),
                                    ),
                                  ),
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Announcement",
                                      value: controller.totalAnnouncements.value
                                          .toString(),
                                      iconPath: 'assets/icons/6.png',
                                      goToPath: AnnouncementsScreen(),
                                    ),
                                  ),
                                  DashboardCard(
                                    cardModel: CardModel(
                                      title: "Units ",
                                      value: controller.totalUnits.value
                                          .toString(),
                                      iconPath: 'assets/icons/5.png',
                                      goToPath: UnitsListScreen(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
