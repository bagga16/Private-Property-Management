import 'package:flutter/material.dart';
import 'package:private_property_management/Models/CardModel.dart';

class DashboardCard extends StatelessWidget {
  final CardModel cardModel;

  const DashboardCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(139, 200, 63, 1),
            Color.fromRGBO(76, 127, 90, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.only(top: 22, left: 16, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(35, 79, 104, 1),
                radius: 18,
                child: Image.asset(
                  cardModel.iconPath,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  cardModel.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              cardModel.value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
