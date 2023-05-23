import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/app_text_styles.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/history/history_bloc.dart';
import '../widgets/custom_video_card.dart';

class DownloadingPage extends StatefulWidget {
  const DownloadingPage({super.key});

  @override
  State<DownloadingPage> createState() => _DownloadingPageState();
}

class _DownloadingPageState extends State<DownloadingPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(GetToBoxEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HistoryLoadedState) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 50.h),
            itemCount: state.listVideo.length,
            itemBuilder: (context, index) {
              final item = state.listVideo[index];
              return CustomVideoItem(videoModel: item);
            },
          );
        } else {
          return Center(
            child: Text(
              'page',
              style:
                  AppTextStyles.body22w4.copyWith(color: AppColors.textColor),
            ),
          );
        }
      },
    );
  }
}
