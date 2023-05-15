import 'package:easy_downloader/features/home/presentation/widgets/downloaded_menu_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/assets.dart';
import 'downloading_menu_state_widget.dart';

enum DownloadState {
  download,
  downloading,
  downloaded,
}

Widget switchState({required DownloadState state}) {
  switch (state) {
    case DownloadState.download:
      return InkWell(
        onTap: () {},
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
    case DownloadState.downloading:
      return const DownloadingMenuStateWidget();

    case DownloadState.downloaded:
      return const DownloadedMenuStateWidget();
  }  
}
