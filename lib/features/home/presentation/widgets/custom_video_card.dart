// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/presentation/bloc/download_to_file/downlaod_to_file_bloc.dart';
import 'package:easy_downloader/features/home/presentation/widgets/download_button.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_delete_button.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';

// ignore: must_be_immutable
class CustomVideoCard extends StatefulWidget {
  final VideoModel videoModel;
  const CustomVideoCard({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  State<CustomVideoCard> createState() => _CustomVideoCardState();
}

class _CustomVideoCardState extends State<CustomVideoCard> {
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
      height: 400.h,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 230.w,
            width: double.maxFinite,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: VideoPlayer(videoPlayerController),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                          ? widget.videoModel.url!.substring(8, 35)
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
                SizedBox(
                  width: 8.w,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
}
