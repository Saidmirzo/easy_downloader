import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/assets.dart';
import 'package:easy_downloader/features/home/presentation/pages/home_pag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'downloaded.dart';
import 'downloading.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController();

  List<String> listNavBarItems = [
    Assets.icons.home,
    Assets.icons.downloading,
    Assets.icons.downloaded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          DownloadingPage(),
          DownloadedPage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.symmetric(vertical: 16.w, horizontal: 18.w),
        decoration: BoxDecoration(
            color: AppColors.bottomAppBarColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(50.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage = index;
                });
              },
              child: Container(
                width: 45.h,
                height: 45.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedPage == index ? AppColors.white : null),
                child: Image.asset(
                  listNavBarItems[index],
                  height: 31.h,
                  color: index == selectedPage
                      ? AppColors.bottomAppBarColor
                      : AppColors.white,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
