import 'package:flutter/material.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Illustration
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/logo.png', // Add your top illustration here
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 12),
              // "Let's Sign In" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      ),
                    ),
                    const SizedBox(height: 90),
                    // Email Input Field
                    const CustomTextField(
                      hintText: "Enter Email / Username",
                      keyboardType: TextInputType.emailAddress,
                      height: 70,
                      borderRadius: 10.0,
                    ),
                    const SizedBox(height: 16),
                    // Password Input Field
                    const CustomTextField(
                      hintText: "Password",
                      height: 70,
                      isPassword: true,
                      borderRadius: 10.0,
                    ),
                    const SizedBox(height: 81),
                    // Login Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 95,
                          height: 63,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(139, 200, 63, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
