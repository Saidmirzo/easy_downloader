import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key, this.widget, required this.onTap});
  final Widget? widget;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 35.w,
        width: 35.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.r,
              color: AppColors.textColor.shade75.withOpacity(0.1),
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: widget ??
            SvgPicture.asset(
              Assets.icons.delete,
              color: AppColors.textColor.shade25,
              width: 15,
              height: 20,
            ),
      ),
    );
  }
}
