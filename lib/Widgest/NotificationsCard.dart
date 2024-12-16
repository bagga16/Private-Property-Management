import 'package:flutter/material.dart';
import 'package:private_property_management/Models/NotificationModel%20.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromRGBO(35, 79, 104, 1),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/notifications.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(width: 6),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    Text(
                      notification.date,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  notification.description,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
