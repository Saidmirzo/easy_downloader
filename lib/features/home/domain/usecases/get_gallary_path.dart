import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/domain/repository/easy_downloader_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class GetGallaryPathUseCase implements UseCase<String, NoParams> {
  final EasyDownloaderRepository easyDownloaderRepository;
  GetGallaryPathUseCase({required this.easyDownloaderRepository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
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
            return Right(newDirectory.path);
          } else {
            directory = await getExternalStorageDirectory();
            return Right(directory!.path);
          }
        }
        return Right(newDirectory.path);
      }
    } catch (e) {
      return Left(StorageFailure());
    }

    return Right(directory!.path);
  }
}

class NoParams {}
