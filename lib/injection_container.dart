import 'package:easy_downloader/features/home/data/datasource/download_video_remote_data_source.dart';
import 'package:easy_downloader/features/home/data/repository/easy_downloader_repository_impl.dart';
import 'package:easy_downloader/features/home/domain/repository/easy_downloader_repository.dart';
import 'package:easy_downloader/features/home/domain/usecases/download_to_file_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/download_video_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/get_gallary_path.dart';
import 'package:easy_downloader/features/home/domain/usecases/get_video_info_usecase.dart';
import 'package:easy_downloader/features/home/presentation/bloc/download_to_file/downlaod_to_file_bloc.dart';
import 'package:easy_downloader/features/home/presentation/bloc/easy_downloader/easy_downloader_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/netwok/network_info.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  //! Features Sign In BLoc

  //Bloc
  sl.registerFactory(() => DownloadToFileBloc(
        downloadToFileUseCase: sl(),
        getGallaryPathUseCase: sl(),
      ));
  sl.registerLazySingleton(() => SaveToFileEvent(videoModel: sl(), name: sl()));
  sl.registerFactory(
    () => EasyDownloaderBloc(
      downloadVideoUseCase: sl(),
      getVideoInfoUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetVideoInfoEvent(link: sl()));
  //Use cases
  sl.registerLazySingleton(() => DownloadToFileUseCase());

  sl.registerLazySingleton(
    () => GetVideoInfoUseCase(easyDownloaderRepository: sl()),
  );

  sl.registerLazySingleton(
      () => GetGallaryPathUseCase(easyDownloaderRepository: sl()));

  sl.registerLazySingleton(
      () => DownloadVideoUseCase(easyDownloaderRepository: sl()));

  //Repositoyies
  sl.registerLazySingleton<EasyDownloaderRepository>(
      () => EasyDownloaderRepositoryImpl(
            networkInfo: sl(),
            downloadVideoRemoteDataSource: sl(),
          ));

  // Data Sourse
  sl.registerLazySingleton<DownloadVideoRemoteDataSource>(
      () => DownloadVideoRemoteDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(interConnection: sl()));

  //!Extarnal
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
