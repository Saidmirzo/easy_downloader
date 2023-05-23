import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/assets.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.w,
        width: 35.w,
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
        child: SvgPicture.asset(
          Assets.icons.downloadIcon,
        ),
      ),
    );
  }
}
