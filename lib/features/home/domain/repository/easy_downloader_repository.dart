import 'package:dartz/dartz.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';

import '../../../../core/errors/failures.dart';

abstract class EasyDownloaderRepository {
  Future<Either<Failure, String>> downloadVideo(String link);
  Future<Either<Failure, VideoModel>> getVideoInfo(String link);
}
