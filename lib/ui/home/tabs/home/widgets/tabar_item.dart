import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const TabBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.whiteColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          icon,
          color: isSelected ? AppColors.purpleColor : Colors.white,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.purpleColor : Colors.white,
          ),
        ),
      ]),
    );
  }
}
