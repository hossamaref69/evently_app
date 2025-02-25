import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/constants/event_categories.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/firebase_helper/firestore/firestore_helper.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:evently_app/ui/create_event/tab_widget.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/service/local_stronge_service.dart';
import '../../../../core/theme/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedTap = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: EventCategories.eventCategories.length,
      child: Column(
        children: [
          Container(
            height: 0.20.height,
            decoration: const BoxDecoration(
                color: AppColors.purpleColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back ✨",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            LocalStorageService.getUserName()?? "",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ImageIcon(
                                AssetImage(AppAssets.mapIconUnselected),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Cairo , Egypt",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(AppAssets.sunIcon),
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: Text("EN",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.purpleColor)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      setState(() {
                        selectedTap = value;
                      });
                    },
                    tabs: EventCategories.eventCategories.map(
                      (element) {
                        return TabWidget(
                          isInHomeTab: true,
                          eventCategory: element,
                          isSelected: selectedTap ==
                              EventCategories.eventCategories.indexOf(element),
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: StreamBuilder<QuerySnapshot<EventDM>>(
                  stream: FirestoreHelper.getEventsByCategory(EventCategories
                      .eventCategories[selectedTap].eventCategoryName),
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
            ),
          ),
        ],
      ),
    );
  }
}
