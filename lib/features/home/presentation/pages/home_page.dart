import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/features/home/presentation/pages/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'downloaded.dart';
import 'downloading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [DownloadPage(), DownloadingPage(), DownloadedPage()],
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
                  child: const Text('%')),
            ),
          ),
        ),
      ),
    );
  }
}
