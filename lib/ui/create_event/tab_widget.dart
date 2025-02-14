import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/models/event_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final EventCategory eventCategory;
  final bool isSelected;
  final bool isInHomeTab;

  const TabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
    required this.isInHomeTab,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ?
        (isInHomeTab ? AppColors.whiteColor : AppColors.purpleColor)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: isInHomeTab
            ? Border.all(color: Colors.white)
            : Border.all(color: AppColors.purpleColor),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color:isSelected
                ? (isInHomeTab ? AppColors.purpleColor : Colors.white)
                : (isInHomeTab ? Colors.white : AppColors.purpleColor)
          ),
         const  SizedBox(width: 5),
          Text(
            eventCategory.eventCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? (isInHomeTab ? AppColors.purpleColor : AppColors.whiteColor)
                    : (isInHomeTab ? AppColors.whiteColor : AppColors.purpleColor)
            )
          )
        ],
      ),
    );
  }
}