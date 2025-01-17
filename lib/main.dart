import 'package:firebase_core/firebase_core.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/Home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.user != null ? const HomeScreen() : LoginPage();
      }),
    );
  }
}
