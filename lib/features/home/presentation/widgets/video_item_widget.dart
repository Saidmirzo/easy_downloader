// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';

// ignore: must_be_immutable
class VideoItemWidget extends StatefulWidget {
  final String description;
  final String videoName;
  final String videoSize;
  final Widget widget;
  final VideoModel videoModel;
  VideoItemWidget({
    Key? key,
    required this.description,
    required this.videoName,
    required this.videoSize,
    required this.widget,
    required this.videoModel,
  }) : super(key: key);

  @override
  State<VideoItemWidget> createState() => _VideoItemWidgetState();
}

class _VideoItemWidgetState extends State<VideoItemWidget> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.videoModel.url ?? '')
          ..initialize().then((value) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
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
          InkWell(
            onTap: () {
              if (videoPlayerController.value.isPlaying) {
                videoPlayerController.pause();
              } else {
                videoPlayerController.play();
              }
            },
            child: Container(
              height: 80.w,
              width: 115.w,
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                // image: DecorationImage(
                //   image: AssetImage(
                //     image,
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: VideoPlayer(videoPlayerController),
              // child: ,
              // child: Container(
              //   height: 33.75.w,
              //   width: 33.75.w,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(9.75.r),
              //     color: AppColors.textColor.withOpacity(0.4),
              //   ),
              //   child: SvgPicture.asset(
              //     Assets.icons.pauseIcon,
              //     color: white,
              //   ),
              // ),
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
                widget.description,
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.textColor.shade25,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.videoName,
                style: AppTextStyles.body16w7.copyWith(
                  color: AppColors.textColor.shade75,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.videoSize,
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
          widget.widget,
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
