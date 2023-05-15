import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/assets.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedPage = 0;
  List<String> listNavBarItems = [
    Assets.icons.home,
    Assets.icons.downloading,
    Assets.icons.downloaded,
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 18.w,
      left: 18.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            height: 60.h,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () {
                    widget.pageController.jumpToPage(index);
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
                          ? AppColors.primaryColor
                          : AppColors.white,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
