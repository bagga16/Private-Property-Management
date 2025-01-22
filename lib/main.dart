import 'package:firebase_core/firebase_core.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceScreen%20.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/AddUnitScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitsListScreen.dart';
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
        GetPage(
          name: '/add-unit',
          page: () => AddUnitScreen(),
        ),
        GetPage(
          name: '/units-list',
          page: () => UnitsListScreen(),
        ),
        GetPage(name: '/maintenance-screen', page: () => MaintenanceScreen()),
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
