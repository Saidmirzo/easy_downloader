import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/errors.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/netwok/network_info.dart';
import 'package:easy_downloader/features/home/data/datasource/download_video_data_source.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/repository/easy_downloader_repository.dart';
import 'package:http/http.dart';

class EasyDownloaderRepositoryImpl implements EasyDownloaderRepository {
  final NetworkInfo networkInfo;
  final DownloadVideoRemoteDataSource downloadVideoRemoteDataSource;
  EasyDownloaderRepositoryImpl(
      {required this.networkInfo, required this.downloadVideoRemoteDataSource});

  @override
  Future<Either<Failure, String>> downloadVideo(String link) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await downloadVideoRemoteDataSource.downloadVideo(link);
        return Right(response);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      Left(ConnectionFailure());
    }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, VideoModel>> getVideoInfo(String link) async {
    if (await networkInfo.isConnected) {
      try {
        final videoInfo =
            await downloadVideoRemoteDataSource.getVideoInfo(link);
        return Right(videoInfo);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
