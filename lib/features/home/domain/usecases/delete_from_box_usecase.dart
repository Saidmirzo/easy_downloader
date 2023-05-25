import 'package:dartz/dartz.dart';
import 'package:easy_downloader/core/errors/failures.dart';
import 'package:easy_downloader/core/usecase/usecase.dart';
import 'package:easy_downloader/features/home/domain/repository/cache_repository.dart';

class DeleteFromBoxUseCase implements UseCase<String, DeleteBoxParams> {
  final CacheRepository cacheRepository;
  DeleteFromBoxUseCase({required this.cacheRepository});
  @override
  Future<Either<Failure, String>> call(DeleteBoxParams params)  {
    return cacheRepository.deleteFromLocalData(params.boxName, params.index);
  }
}

class DeleteBoxParams {
  final String boxName;
  final int index;
  DeleteBoxParams({required this.boxName, required this.index});
}
