import 'package:flutter/material.dart';
import 'package:private_property_management/Models/NotificationModel%20.dart';
import 'package:private_property_management/Widgest/NotificationsCard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "Today",
      ),
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "Yesterday",
      ),
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "2/02/2024",
      ),
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "Today",
      ),
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "Today",
      ),
      NotificationModel(
        title: "Maintenance Request",
        description:
            "Lorem ipsum dolor sit amet consectetur. Enim felis risus maecenas ut egestas sagittis varius tempus pharetra.",
        date: "Today",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      radius: 26,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  const Text("                    ")
                ],
              ),
              const SizedBox(height: 34),
              // Notifications List
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationCard(notification: notifications[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
