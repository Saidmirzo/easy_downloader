import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DownloadingMenuStateWidget extends StatefulWidget {
  const DownloadingMenuStateWidget({super.key});

  @override
  State<DownloadingMenuStateWidget> createState() =>
      _DownloadingMenuStateWidgetState();
}

class _DownloadingMenuStateWidgetState
    extends State<DownloadingMenuStateWidget> {
  Color indicatorColor = AppColors.primaryColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: CircularPercentIndicator(
            radius: 13.w,
            lineWidth: 3,
            percent: 0.3,
            backgroundColor: indicatorColor.withOpacity(0.3),
            progressColor: indicatorColor,
            center: Container(
              height: 6.w,
              width: 6.w,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "54%",
          style: AppTextStyles.body10w4.copyWith(
            color: AppColors.textColor.shade50,
          ),
        ),
      ],
    );
  }
}
