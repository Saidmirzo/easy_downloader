import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/features/home/data/datasource/save_to_hive_local_datasource.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/repository/cache_repository.dart';

class CacheRepositoryImpl implements CacheRepository {
  final SaveToHiveLocalDataSource saveToHiveLocalDataSource;
  CacheRepositoryImpl({required this.saveToHiveLocalDataSource});
  @override
  Future<Either<Failure, List<VideoModel>>> getLocalData(String boxName) async {
    try {
      final result = await saveToHiveLocalDataSource.getToBox(boxName);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> setLocalData(
      String boxName, VideoModel value) async {
    try {
      await saveToHiveLocalDataSource.saveToBox(boxName, value);
      return const Right('');
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteFromLocalData(
      String boxName, int index) async {
    try {
      await saveToHiveLocalDataSource.deleteFromoBox(boxName, index);
      return const Right('');
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
