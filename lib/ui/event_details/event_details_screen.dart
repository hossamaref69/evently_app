import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/firebase_helper/firestore/firestore_helper.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/theme/app_colors.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as EventDM;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ScreensRouteName.createEvent, arguments: args);
            },
            icon: const Icon(
              Icons.edit,
              size: 28,
              color: AppColors.purpleColor,
            ),
          ),
          IconButton(
            onPressed: () {
             FirestoreHelper.deleteEvent(args).
             then((value) {
               if(value){
                 EasyLoading.showSuccess("Event Deleted Successfully");
                 Navigator.pop(context);
               }
             });
            },
            icon: const Icon(
              Icons.delete_outline,
              size: 28,
              color: Color(0xffFF5659),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 1.0.width,
                  height: 0.26.height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                     args.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  args.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.purpleColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                  ),
                ),
                const SizedBox(height: 8),
                CustomButton(
                    date: args.date,
                    icon: Icons.calendar_month
                ),
                SizedBox(height: .02.height,),
                CustomButton(
                    title: "Cairo, Egypt",
                    icon: Icons.my_location_outlined
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: AppColors.purpleColor, width: 1)
                    ),
                  ),
                ),
                const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Text(
                  args.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    )
                )
              ],
          ),
        ),
      ),
    );
  }
}
