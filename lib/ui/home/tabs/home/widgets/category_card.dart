import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/firebase_helper/firestore/firestore_helper.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCard extends StatelessWidget {
  final EventDM eventDM;
  const CategoryCard({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 0.9.width,
      height: 0.25.height,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(eventDM.image),
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF2FEFF),
            ),
            child: Text(
              DateFormat("dd MMM").format(eventDM.date),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.purpleColor,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    eventDM.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const SizedBox(width: 2,),
                GestureDetector(
                  onTap:  () {
                    eventDM.isFavorite = !eventDM.isFavorite;
                    FirestoreHelper.updateEvent(eventDM);
                  },
                  child: Icon(
                    eventDM.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.purpleColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
