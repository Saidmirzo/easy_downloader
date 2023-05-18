import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/repository/easy_downloader_repository.dart';

import 'download_video_usecase.dart';

class GetVideoInfoUseCase implements UseCase<VideoModel, Params> {
  final EasyDownloaderRepository easyDownloaderRepository;

  GetVideoInfoUseCase({required this.easyDownloaderRepository});

  @override
  Future<Either<Failure, VideoModel>> call(Params params) {
    return easyDownloaderRepository.getVideoInfo(params.link);
  }
}
