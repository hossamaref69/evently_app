import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/category_card.dart';
import 'package:evently_app/ui/home/tabs/home/widgets/tabar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            "John Safwat",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Row(
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
                const Expanded(
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabs: [
                      TabBarItem(
                        title: "All",
                        icon: Icons.home,
                        isSelected: true,
                      ),
                      TabBarItem(
                        title: "Home",
                        icon: Icons.home,
                        isSelected: false,
                      ),
                      TabBarItem(
                        title: "Home",
                        icon: Icons.home,
                        isSelected: false,
                      ),
                      TabBarItem(
                        title: "Home",
                        icon: Icons.home,
                        isSelected: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemBuilder: (context, index) {
                return CategoryCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16,);
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
