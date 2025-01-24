import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/ui/home/tabs/home/home_tab.dart';
import 'package:evently_app/ui/home/tabs/love/love_tab.dart';
import 'package:evently_app/ui/home/tabs/map/map_tab.dart';
import 'package:evently_app/ui/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const LoveTab(),
    const ProfileTab(),
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.purpleColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(
            side: BorderSide(color: Colors.white, width: 6)
          ),
          backgroundColor: AppColors.purpleColor,
          elevation:0,
          child: const Icon(Icons.add, color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.purpleColor,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage(AppAssets.homeIconSelected),
                  color: Colors.white,
                ),
                icon: ImageIcon(
                  AssetImage(AppAssets.homeIconUnselected),
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon:  ImageIcon(
                  AssetImage(AppAssets.mapIconSelected),
                  color: Colors.white,
                ),
                icon: ImageIcon(
                  AssetImage(AppAssets.mapIconUnselected),
                  color: Colors.white,
                ),
                label: "Map",
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage(AppAssets.favIconSelected),
                  color: Colors.white,
                ),
                icon: ImageIcon(
                  AssetImage(AppAssets.favIconUnSelected),
                  color: Colors.white,
                ),
                label: "Love",
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage(AppAssets.profileIconSelected),
                  color: Colors.white,
                ),
                icon: ImageIcon(
                  AssetImage(AppAssets.profileIconUnSelected),
                  color: Colors.white,
                ),
                label: "Profile",
              ),
            ]
        ),
      ),
    );
  }
}
