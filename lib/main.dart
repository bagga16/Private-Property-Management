import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceScreen%20.dart';
import 'package:private_property_management/App%20Screen/Payments/PaymentsScreen.dart';
import 'package:private_property_management/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: PaymentsScreen());
  }
}
