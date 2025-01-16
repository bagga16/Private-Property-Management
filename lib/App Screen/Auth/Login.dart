// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:private_property_management/Home.dart';
// import 'package:private_property_management/App%20Screen/Auth/SignUpScreen.dart';
// import 'package:private_property_management/Widgest/CustomTextField.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({super.key});

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _showAlertDialog(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         title: const Text(
//           "Alert!",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
//         ),
//         content: Text(message),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context), child: const Text("OK"))
//         ],
//       ),
//     );
//   }

//   Future<void> _login(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomeScreen()),
//       );
//     } catch (e) {
//       _showAlertDialog(context, "Login failed. Please check your credentials.");
//     }
//   }

//   bool _validateInputs(BuildContext context) {
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       _showAlertDialog(context, "Please fill in all fields.");
//       return false;
//     }
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: double.infinity,
//                   child: Image.asset('assets/images/logo.png',
//                       fit: BoxFit.fitWidth),
//                 ),
//                 const SizedBox(height: 12),
//                 const Center(
//                     child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "Let’s ",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromRGBO(37, 43, 92, 1),
//                         ),
//                       ),
//                       TextSpan(
//                         text: "Sign In",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w800,
//                           color: Color.fromRGBO(31, 76, 107, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//                 const SizedBox(height: 90),
//                 CustomTextField(
//                     hintText: "Enter Email", controller: _emailController),
//                 const SizedBox(height: 16),
//                 CustomTextField(
//                     hintText: "Password",
//                     controller: _passwordController,
//                     isPassword: true),
//                 const SizedBox(height: 81),
//                 // Login Button
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width - 95,
//                   height: 63,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_validateInputs(context)) {
//                         _login(context);
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Text("Login",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 18)),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 InkWell(
//                   onTap: () => Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SignUpScreen())),
//                   child: const Text(
//                     "Don't have an account? Sign Up",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: const Color.fromRGBO(139, 200, 63, 1),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/App%20Screen/Auth/SignUpScreen.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Alert!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

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
                    hintText: "Enter Email", controller: emailController),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Password",
                    controller: passwordController,
                    isPassword: true),
                const SizedBox(height: 81),
                // Login Button
                SizedBox(
                  width: MediaQuery.of(context).size.width - 95,
                  height: 63,
                  child: ElevatedButton(
                    onPressed: () {
                      authController.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
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
                  onTap: () => Get.to(() => SignUpScreen()),
                  child: const Text(
                    "Don't have an account? Sign Up",
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
