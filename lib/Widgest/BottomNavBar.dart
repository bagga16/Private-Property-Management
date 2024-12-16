import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.dashboard,
            label: "Dashboard",
            isActive: currentIndex == 0,
          ),
          _buildNavItem(
            index: 1,
            imagePath: 'assets/icons/properties.png',
            label: "Properties",
            isActive: currentIndex == 1,
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.people,
            label: "Tenants",
            isActive: currentIndex == 2,
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.settings,
            label: "Settings",
            isActive: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    IconData? icon,
    String? imagePath,
    required String label,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: isActive
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8)
            : const EdgeInsets.all(0),
        decoration: isActive
            ? BoxDecoration(
                color: const Color.fromRGBO(244, 241, 253, 1),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath,
                width: isActive ? 28 : 24,
                height: isActive ? 28 : 24,
                color: isActive
                    ? const Color.fromRGBO(139, 200, 63, 1)
                    : const Color.fromRGBO(157, 178, 206, 1),
              )
            else if (icon != null)
              Icon(
                icon,
                size: isActive ? 28 : 24,
                color: isActive
                    ? const Color.fromRGBO(139, 200, 63, 1)
                    : const Color.fromRGBO(157, 178, 206, 1),
              ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(139, 200, 63, 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
