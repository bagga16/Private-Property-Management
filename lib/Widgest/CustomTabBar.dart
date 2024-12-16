import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        tabs.length,
        (index) => GestureDetector(
          onTap: () => onTabSelected(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? const Color.fromRGBO(235, 240, 255, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selectedIndex == index
                    ? const Color.fromRGBO(37, 43, 92, 1)
                    : const Color.fromRGBO(115, 115, 115, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
