import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/Controllers/DashBoardController.dart';
import 'package:private_property_management/Controllers/SettingsController.dart';
import 'package:private_property_management/Home.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Getter for the current user's ID
  String? get userId => _auth.currentUser?.uid;

  final Rxn<User> _firebaseUser = Rxn<User>();
  User? get user => _firebaseUser.value;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final sEmailController = TextEditingController();
  final sPasswordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackbar("Error", "Please fill all fields", isError: true);
      return;
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Clear and reinitialize controllers to load the new user's data
      Get.delete<DashboardController>();
      Get.put(DashboardController()); // Initialize with fresh state

      Get.delete<SettingsController>();
      Get.put(SettingsController()); // Initialize with fresh state

      clearFields();
      showSnackbar("Success", "Login successful", isError: false);
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      showSnackbar("Login Failed", e.toString(), isError: true);
    }
  }

  Future<void> signUp() async {
    final email = sEmailController.text.trim();
    final password = sPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackbar("Error", "Please fill all fields", isError: true);
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
      });

      clearFields();
      showSnackbar("Success", "Sign Up successful", isError: false);
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      showSnackbar("Sign Up Failed", e.toString(), isError: true);
    }
  }

  void logout() async {
    await _auth.signOut();

    // Clear all controllers that hold user-specific data
    Get.delete<DashboardController>(); // Replace with actual controllers
    Get.delete<SettingsController>(); // Replace with actual controllers

    // Clear user information in AuthController
    _firebaseUser.value = null;

    // Navigate to login page
    Get.offAll(() => LoginPage());
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
    sEmailController.clear();
    sPasswordController.clear();
  }

  void showSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }
}
