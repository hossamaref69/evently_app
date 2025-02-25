import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomButton extends StatelessWidget {
  String? title;
  DateTime? date;
  IconData icon;

  CustomButton({
    super.key,
    this.title,
    required this.icon,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          side: const BorderSide(color: AppColors.purpleColor)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.purpleColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Icon(
              icon,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title ?? DateFormat("dd MMM yyy").format(date!),
            style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.purpleColor),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.purpleColor,
          ),
        ],
      ),
    );
  }
}
