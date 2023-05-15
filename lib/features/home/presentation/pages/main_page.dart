import 'dart:ui';

import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/assets.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'downloaded.dart';
import 'downloading.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: const [
                HomePage(),
                DownloadingPage(),
                DownloadedPage(),
              ],
            ),
            const CustomSearchBar(),
            CustomBottomNavBar(pageController: pageController),
          ],
        ),
      ),
    );
  }
}
