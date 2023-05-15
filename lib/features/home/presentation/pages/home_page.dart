import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/constants/assets/assets.dart';
import '../widgets/custom_searchbar.dart';
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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => DownLoadingContainerWidget(
        image: Assets.images.bitmapImage,
        description: "The SpongeBob Movie",
        videoName: "Sponge on the Run",
        videoSize: "20 Mb",
        widget: switchState(state: DownloadState.downloading),
      ),
    );
  }
}
