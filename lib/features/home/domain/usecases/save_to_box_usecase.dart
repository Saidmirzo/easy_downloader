
import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/repository/cache_repository.dart';

class SaveToBoxUseCase implements UseCase<String, BoxParams> {
  final CacheRepository cacheRepository;
  SaveToBoxUseCase({required this.cacheRepository});
  @override
  Future<Either<Failure, String>> call(BoxParams params) {
    return cacheRepository.setLocalData(params.boxName, params.value);
  }
}

class BoxParams {
  final String boxName;
  final VideoModel value;
  BoxParams({required  this.boxName,required  this.value});
}
