import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/App%20Screen/Auth/Login.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Alert!"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

  Future<void> _signUp(BuildContext context) async {
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': _emailController.text.trim(),
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      _showAlertDialog(context, e.toString());
    }
  }

  bool _validateInputs(BuildContext context) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showAlertDialog(context, "Please fill in all fields.");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
                    hintText: "Enter Email", controller: _emailController),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Password",
                    controller: _passwordController,
                    isPassword: true),
                const SizedBox(height: 81),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 95,
                  height: 63,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_validateInputs(context)) {
                        _signUp(context);
                      }
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
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
