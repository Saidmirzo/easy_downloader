import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadToFileUseCase implements UseCase<String, DownloadFileParams> {
  @override
  Future<Either<Failure, String>> call(DownloadFileParams params) async {
    if (await Permission.storage.isGranted) {
      final id = await FlutterDownloader.enqueue(
        url: params.link,
        savedDir: params.filePath,
        fileName: params.name,
      );
      return Right(id ?? '');
    } else {
      await Permission.storage.request();
      return await call(params);
    }
      // return Left(StorageFailure());
  }
}

class DownloadFileParams {
  final String link;
  final String filePath;
  final String name;
  DownloadFileParams({
    required this.filePath,
    required this.link,
    required this.name,
  });
}
