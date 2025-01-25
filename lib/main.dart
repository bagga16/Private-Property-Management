import 'package:firebase_core/firebase_core.dart';
import 'package:private_property_management/App%20Screen/Anouncements/AnouncementsScreen.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceScreen%20.dart';
import 'package:private_property_management/App%20Screen/Proprties/PropertiesScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Workers/workers_list_screen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TanentsScreen.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/Home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

import 'App Screen/Maintanance/MaintenanceEditScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        // GetPage(
        //   name: '/add-unit',
        //   page: () => AddUnitScreen(),
        // ),
        // GetPage(
        //   name: '/units-list',
        //   page: () => UnitsListScreen(),
        // ),
        GetPage(name: '/maintenance-screen', page: () => MaintenanceScreen()),
        GetPage(name: '/property-screen', page: () => Propertiesscreen()),
        GetPage(name: '/tenant-screen', page: () => TenantsScreen()),
        GetPage(name: '/worker-screen', page: () => WorkersListScreen()),
        GetPage(
            name: '/announcements-screen', page: () => AnnouncementsScreen()),
        GetPage(
          name: '/maintenance-edit-screen',
          page: () => MaintenanceEditScreen(
            request: Get.arguments as MaintenanceRequestModel,
          ),
        ),
      ],
      home: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.user != null ? const HomeScreen() : LoginPage();
      }),
    );
  }
}
