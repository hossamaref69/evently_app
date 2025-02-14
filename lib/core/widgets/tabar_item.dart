import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/models/event_category.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isInHomeTab;

  const TabBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.isInHomeTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ?
           (isInHomeTab ? AppColors.whiteColor : AppColors.purpleColor)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isInHomeTab
            ? Border.all(color: Colors.white)
            : Border.all(color: AppColors.purpleColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? (isInHomeTab ? AppColors.purpleColor : Colors.white)
                : (isInHomeTab ? Colors.white : AppColors.purpleColor)
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:  isSelected
                  ? (isInHomeTab ? AppColors.purpleColor : AppColors.whiteColor)
                  : (isInHomeTab ? AppColors.whiteColor : AppColors.purpleColor)
            ),
          ),
        ],
      ),
    );
  }
}
