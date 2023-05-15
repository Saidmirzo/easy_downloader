import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';
import '../../../../data/constants/assets/assets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      right: 20.w,
      left: 20.w,
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55.h,
            width: 285.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 21.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.shade50,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: AppColors.textColor.withOpacity(.067),
              ),
            ),
            child: TextField(
              cursorColor: AppColors.textColor.shade75,
              style: AppTextStyles.body16w4.copyWith(
                color: AppColors.textColor.shade75,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Video link",
                hintStyle: AppTextStyles.body16w4.copyWith(
                  color: AppColors.textColor.shade25,
                ),
              ),
            ),
          ),
          Container(
            height: 35.h,
            width: 35.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SvgPicture.asset(Assets.icons.searchIcon),
          )
        ],
      ),
    );
  }
}
