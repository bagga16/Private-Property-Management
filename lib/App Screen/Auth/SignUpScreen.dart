import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset('assets/images/logo.png',
                      fit: BoxFit.fitWidth),
                ),
                const SizedBox(height: 12),
                const Center(
                    child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Let’s ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(37, 43, 92, 1),
                        ),
                      ),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color.fromRGBO(31, 76, 107, 1),
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 90),
                CustomTextField(
                    hintText: "Enter Email",
                    controller: authController.sEmailController),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: "Password",
                    controller: authController.sPasswordController,
                    isPassword: true),
                const SizedBox(height: 81),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 95,
                  height: 63,
                  child: ElevatedButton(
                    onPressed: () {
                      authController.signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () => Get.to(() => LoginPage()),
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromRGBO(139, 200, 63, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
