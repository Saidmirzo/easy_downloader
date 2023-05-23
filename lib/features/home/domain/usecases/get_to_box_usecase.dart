import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/domain/repository/cache_repository.dart';

import '../../data/models/video_model.dart';

class GetToBoxUseCase implements UseCase<List<VideoModel>, GetBoxParams> {
  final CacheRepository cacheRepository;
  GetToBoxUseCase({required this.cacheRepository});
  @override
  Future<Either<Failure, List<VideoModel>>> call(GetBoxParams params)  {
    return  cacheRepository.getLocalData(params.boxName);
  }
}

class GetBoxParams {
  final String boxName;
  GetBoxParams({required this.boxName});
}
