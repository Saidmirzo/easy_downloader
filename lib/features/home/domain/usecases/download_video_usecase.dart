import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/domain/repository/easy_downloader_repository.dart';

class DownloadVideoUseCase implements UseCase<String, Params> {
  final EasyDownloaderRepository easyDownloaderRepository;
  DownloadVideoUseCase({required this.easyDownloaderRepository});

  @override
  Future<Either<Failure, String>> call(Params params) {
    return easyDownloaderRepository.downloadVideo(params.link);
  }
}

class Params {
  final String link;
  Params({required this.link});
}
