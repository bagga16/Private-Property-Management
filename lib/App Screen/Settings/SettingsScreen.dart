import 'package:flutter/material.dart';
import 'package:private_property_management/Home.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 28, right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button and Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Settings  ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  const Spacer(), // Maintain alignment
                  const SizedBox(width: 40), // Placeholder for symmetry
                ],
              ),
              const SizedBox(height: 30),

              // Profile Avatar
              const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                  child: Image(image: AssetImage('assets/images/profile.png'))),

              const SizedBox(height: 7),

              // User Name and ID
              const Text(
                "Qwerty Jonathan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ID: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  Text(
                    "5554112",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Role and Contact Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 18, right: 12, bottom: 18, top: 15),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 244, 248, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "  Role: ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                        const Text(
                          "Manager",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(139, 200, 63, 1),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Handle edit action
                          },
                          child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                              child: Image(
                                  image: AssetImage(
                                      'assets/icons/edditProfile.png'))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Color.fromRGBO(139, 200, 63, 1),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "example@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color.fromRGBO(139, 200, 63, 1),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "+1 321 2552 3321",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Log Out Button
              GestureDetector(
                onTap: () {
                  // Handle log out action
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
