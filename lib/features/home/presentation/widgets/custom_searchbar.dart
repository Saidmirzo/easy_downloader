import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import '../../../../data/constants/assets/app_colors.dart';
import '../../../../data/constants/assets/app_text_styles.dart';
import '../../../../data/constants/assets/assets.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  int count = 0;
  String link =
      "https://rr4---sn-01oxu-u5nk.googlevideo.com/videoplayback?expire=1684299005&ei=nQhkZPPUGs2BkgaIqbjQBQ&ip=52.41.36.82&id=o-AJgKhvN1VPgn2xzGuH5lMQjO7yu8Wzu3BkGnNn-z9D78&itag=18&source=youtube&requiressl=yes&vprv=1&svpuc=1&mime=video%2Fmp4&ns=2yvw1n2ZERc2twpLfWaTnuAN&gir=yes&clen=6050658&ratebypass=yes&dur=193.816&lmt=1684164165438204&fexp=24007246&c=WEB&txp=5319224&n=nT_8kGzSzUZkZg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgBsx9lVpTjBwqdUVfHIO7bBbyp4oCRW5VaQbHqSpNH74CIQCIbUJ00ryGqQnYJdY3Cfcbya5oYO4fbwESTQ8OzX-5eg%3D%3D&redirect_counter=1&rm=sn-nx5s67e&req_id=b52545d477a3ee&cms_redirect=yes&ipbypass=yes&mh=ZU&mip=213.230.112.179&mm=31&mn=sn-01oxu-u5nk&ms=au&mt=1684277104&mv=m&mvi=4&pl=23&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgSVAa00b3Vv1siznQNPoGowffuiZTulma1yIbL5a1248CIFSSZ4JlzvXIFH3tezaXDYzsqeqtVKGFzw-hACOyDX9o";

  Future<String> getLink() async {
    try {
      final result = await http.get(
        Uri.parse(
            "https://downloader-vsuw.onrender.com/download?URL=${textEditingController.text.isEmpty ? "https://www.youtube.com/watch?v=yOafhb6NS1k" : textEditingController.text}"),
      );
      if (result.statusCode == 200) {
        final newLink = jsonDecode(result.body)["url"];
        return newLink;
      }
    } catch (e) {
      log(e.toString());
    }
    return link;
  }

  void downloadFile() async {
    link = await getLink();
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final basePath = await getGallaryPath();
      log(basePath);

      final id = await FlutterDownloader.enqueue(
        url: link,
        savedDir: basePath,
        fileName: "filename($count).mp4",
      );
      count++;
    } else {
      log("NO permission");
    }
  }

  ReceivePort receivePort = ReceivePort();
  int progress = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, "downloadvideo");
    receivePort.listen((message) {
      setState(() {
        progress = message;
      });
    });

    FlutterDownloader.registerCallback(downloadCallBack);
  }

  static downloadCallBack(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloadvideo")!;
    sendPort.send(progress);
  }

  Future<String> getGallaryPath() async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/EasyDownloader";
        final newDirectory = Directory(newPath);
        final isExist = await newDirectory.exists();
        if (!isExist) {
          final status = await Permission.manageExternalStorage.request();
          if (status.isGranted) {
            await newDirectory.create(recursive: true);
            return newDirectory.path;
          } else {
            directory = await getExternalStorageDirectory();
            return directory!.path;
          }
        }
        return newDirectory.path;
      }
    } catch (e) {
      log(e.toString());
    }
    return directory!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.w,
      left: 20.w,
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55.h,
            width: 285.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 21.w),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.shade50,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: AppColors.textColor.withOpacity(.067),
              ),
            ),
            child: TextField(
              controller: textEditingController,
              cursorColor: AppColors.textColor.shade75,
              style: AppTextStyles.body16w4.copyWith(
                color: AppColors.textColor.shade75,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Video link",
                hintStyle: AppTextStyles.body16w4.copyWith(
                  color: AppColors.textColor.shade25,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  downloadFile();
                  // getLink();
                },
                child: Container(
                  height: 35.h,
                  width: 35.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(Assets.icons.searchIcon),
                ),
              ),
              Text(
                progress.toString(),
                style: AppTextStyles.body14w5.copyWith(
                  color: AppColors.textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
