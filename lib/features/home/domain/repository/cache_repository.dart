import 'package:dartz/dartz.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';

import '../../../../core/errors/failures.dart';

abstract class CacheRepository {
  Future<Either<Failure,List<VideoModel>>> getLocalData(String boxName) ;
  Future<Either<Failure,String>> setLocalData(String boxName , VideoModel value) ;
  Future<Either<Failure,String>> deleteFromLocalData(String boxName , int index) ;
}