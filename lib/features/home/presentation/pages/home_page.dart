import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/assets.dart';
import '../widgets/downloading_container_widget.dart';
import '../widgets/switch_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: DownLoadingContainerWidget(
            image: Assets.images.bitmapImage,
            description: "The SpongeBob Movie",
            videoName: "Sponge on the Run",
            videoSize: "20 Mb",
            function: switchState(state: DownloadState.download),
          ),
        ),
      ),
    );
  }
}
