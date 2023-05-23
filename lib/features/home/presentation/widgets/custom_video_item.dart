import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';
import '../bloc/download_to_file/downlaod_to_file_bloc.dart';
import 'custom_delete_button.dart';
import 'custom_progress_indicator.dart';
import 'download_button.dart';

class CustomVideoItem extends StatefulWidget {
  const CustomVideoItem({super.key, required this.videoModel});
  final VideoModel videoModel;

  @override
  State<CustomVideoItem> createState() => _CustomVideoItemState();
}

class _CustomVideoItemState extends State<CustomVideoItem> {
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
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
        children: [
          Container(
            height: 80.h,
            width: 115.w,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: VideoPlayer(videoPlayerController),
          ),
          SizedBox(
            width: 10.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The SpongeBob Movie',
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.textColor.shade25,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.videoModel.url != null
                    ? widget.videoModel.url!.substring(8, 20)
                    : "Unknown",
                style: AppTextStyles.body16w7.copyWith(
                  color: AppColors.textColor.shade75,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '6.05 MB',
                style: AppTextStyles.body12w4.copyWith(
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          BlocBuilder<DownloadToFileBloc, DownlaodToFileState>(
            builder: (context, state) {
              if (state is DownloadToFileInitial) {
                return DownloadButton(
                  onTap: () {
                    context.read<DownloadToFileBloc>().add(
                          SaveToFileEvent(videoModel: widget.videoModel),
                        );
                  },
                );
              } else if (state is DownloadToFileLoadingState) {
                return CustomProgressIndicator(progress: state.progress);
              }
              if (state is DownloadToFileLoadedState) {
                return CustomDeleteButton(
                  onTap: () {},
                );
              } else {
                return CustomDeleteButton(
                  onTap: () {
                    context.read<DownloadToFileBloc>().add(
                          SaveToFileEvent(videoModel: widget.videoModel),
                        );
                  },
                  widget: const Icon(
                    Icons.refresh_rounded,
                  ),
                );
              }
            },
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.w),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [

          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
