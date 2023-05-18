import 'dart:developer';
import 'dart:io';

import 'package:easy_downloader/data/constants/assets/app_colors.dart';
import 'package:easy_downloader/data/constants/assets/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../data/constants/assets/assets.dart';
import '../bloc/easy_downloader/easy_downloader_bloc.dart';
import '../widgets/video_item_widget.dart';
import '../widgets/switch_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController videoPlayerController;
  final String link =
      'https://rr1---sn-nx5s7n76.googlevideo.com/videoplayback?expire=1684415807&ei=39BlZOzfJ4OlkgaHsJSABA&ip=54.191.253.12&id=o-ABJIq608BP1qtOjypMr98rf6egPPo0fcFgNMXFb0u7hC&itag=18&source=youtube&requiressl=yes&mh=ZU&mm=31%2C29&mn=sn-nx5s7n76%2Csn-nx57ynsl&ms=au%2Crdu&mv=u&mvi=1&pl=24&vprv=1&svpuc=1&mime=video%2Fmp4&ns=suYcVyGr3AD2qDugFH0on40N&gir=yes&clen=6050658&ratebypass=yes&dur=193.816&lmt=1684164165438204&mt=1684391580&fvip=4&fexp=24007246%2C24362687%2C51000023&c=WEB&txp=5319224&n=0xacmF8kEy1Kgw&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRgIhAOp029fMrxzOp6fkdAKTz8dlukVU83SWKMNaNjoOfHkUAiEAxGrU4NETVWibfyF0OKBiCfSEJQDW7ZnFhMYU7CCxbEs%3D&sig=AOq0QJ8wRAIgTucQXzsawADJKBH-QNBQuSTvUWb6HTZzJCOXdUCS11MCIERVS32wMiMbFKrt-rB5j4-uVeHlfMOiVl-nmfkM8tkP';
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(link)
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EasyDownloaderBloc, EasyDownloaderState>(
      builder: (context, state) {
        if (state is EasyDownloaderLoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VideoItemWidget(
                videoModel: state.videoModel,
                description: "The SpongeBob Movie",
                videoName: state.videoModel.url!.substring(10, 20) ?? "",
                videoSize: "20 Mb",
                widget: switchState(state: DownloadState.downloading),
              ),
              // VideoPlayer(videoPlayerController),
              
            ],
          );
          // ListView.builder(
          //   padding: EdgeInsets.only(top: 50.h),
          //   physics: const BouncingScrollPhysics(),
          //   itemCount: 10,
          //   itemBuilder: (context, index) => VideoItemWidget(
          //     image: Assets.images.bitmapImage,
          //     description: "The SpongeBob Movie",
          //     videoName: "Sponge on the Run",
          //     videoSize: "20 Mb",
          //     widget: switchState(state: DownloadState.downloading),
          //   ),
          // );
        }
        if (state is EasyDownloaderLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text(
              'Error',
              style:
                  AppTextStyles.body20w4.copyWith(color: AppColors.textColor),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
