// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';
import '../../../../data/constants/assets/assets.dart';

// ignore: must_be_immutable
class DownLoadingContainerWidget extends StatelessWidget {
  String description;
  String videoName;
  String image;
  String videoSize;
  Widget widget;
  DownLoadingContainerWidget({
    Key? key,
    required this.description,
    required this.videoName,
    required this.image,
    required this.videoSize,
    required this.widget,
  }) : super(key: key);

  Color white = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 12.r,
            color: AppColors.textColor.shade75.withOpacity(0.08),
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80.w,
            width: 115.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              height: 33.75.w,
              width: 33.75.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.75.r),
                color: AppColors.textColor.withOpacity(0.4),
              ),
              child: SvgPicture.asset(
                Assets.icons.pauseIcon,
                color: white,
              ),
            ),
          ),
          SizedBox(
            width: 9.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.textColor.shade25,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                videoName,
                style: AppTextStyles.body16w7.copyWith(
                  color: AppColors.textColor.shade75,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                videoSize,
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 8.w,
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
