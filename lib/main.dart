import 'package:easy_downloader/features/home/presentation/bloc/download_to_file/downlaod_to_file_bloc.dart';
import 'package:easy_downloader/features/home/presentation/bloc/easy_downloader/easy_downloader_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/pages/main_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(ignoreSsl: true);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<DownloadToFileBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<EasyDownloaderBloc>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'easy downloader',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child,
          ),
        );
      },
      child: const MainPage(),
    );
  }
}
