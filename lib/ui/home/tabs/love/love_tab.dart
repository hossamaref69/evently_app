import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/firebase_helper/firestore/firestore_helper.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: .02.height,),
          const CustomTextField(
            hint: "Search For Event",
            hintColor: Colors.grey,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ).setHorizontalPadding(
            context,
            0.02,
            enableMediaQuery: true,
          ),
          SizedBox(height: .02.height,),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot<EventDM>>(
                stream: FirestoreHelper.getStreamFavoriteData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        const Text(
                          "Something went wrong",
                        ),
                        const SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh_outlined,
                            color: AppColors.purpleColor,
                          ),
                        )
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.purpleColor,
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Text("No Event Created Yet..!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ));
                  }
                  List<EventDM> eventDataList = snapshot.data!.docs.map(
                        (element) {
                      return element.data();
                    },
                  ).toList();

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) => CategoryCard(
                      eventDM: eventDataList[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: eventDataList.length,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
