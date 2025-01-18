import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/App%20Screen/Auth/SignUpScreen.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

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
                        text: "Sign In",
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
                    controller: authController.emailController),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Password",
                    controller: authController.passwordController,
                    isPassword: true),
                const SizedBox(height: 81),
                // Login Button
                SizedBox(
                  width: MediaQuery.of(context).size.width - 95,
                  height: 63,
                  child: ElevatedButton(
                    onPressed: () {
                      authController.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                    authController.clearFields();
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(139, 200, 63, 1),
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
