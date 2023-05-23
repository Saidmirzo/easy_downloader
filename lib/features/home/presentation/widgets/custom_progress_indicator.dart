import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key, required this.progress});
  final int progress;

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
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
            percent: widget.progress/100,
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
          "${widget.progress}%",
          style: AppTextStyles.body10w4.copyWith(
            color: AppColors.textColor.shade50,
          ),
        ),
      ],
    );
  }
}
