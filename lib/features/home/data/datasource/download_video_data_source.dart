import 'dart:convert';

import 'package:easy_downloader/core/errors/errors.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:http/http.dart' as http;

abstract class DownloadVideoRemoteDataSource {
  Future<String> downloadVideo(String link);
  Future<VideoModel> getVideoInfo(String link);
}

class DownloadVideoRemoteDataSourceImpl
    implements DownloadVideoRemoteDataSource {
  final http.Client client;
  DownloadVideoRemoteDataSourceImpl({required this.client});
  @override
  Future<String> downloadVideo(String link) async {
    throw Exception();
  }

  @override
  Future<VideoModel> getVideoInfo(String link) async {
    final result = await http.get(
      Uri.parse("https://downloader-vsuw.onrender.com/download?URL=$link"),
    );
    if (result.statusCode == 200) {
      final videoInfo = VideoModel.fromJson(jsonDecode(result.body));
      return videoInfo;
    } else {
      throw ServerException();
    }
  }
}
