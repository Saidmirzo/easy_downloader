
import 'package:easy_downloader/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:easy_downloader/features/home/presentation/widgets/custom_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/download_to_file/downlaod_to_file_bloc.dart';
import 'downloaded.dart';
import 'downloading.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    context.read<DownloadToFileBloc>().add(InitialEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: const [
                HomePage(),
                DownloadingPage(),
                DownloadedPage(),
              ],
            ),
            const CustomSearchBar(),
            CustomBottomNavBar(pageController: pageController),
          ],
        ),
      ),
    );
  }
}
