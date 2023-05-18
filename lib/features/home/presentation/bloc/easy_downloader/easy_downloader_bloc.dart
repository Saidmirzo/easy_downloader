import 'package:bloc/bloc.dart';
import 'package:easy_downloader/features/home/domain/usecases/download_video_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/get_video_info_usecase.dart';
import 'package:equatable/equatable.dart';

part 'easy_downloader_event.dart';
part 'easy_downloader_state.dart';

class EasyDownloaderBloc
    extends Bloc<EasyDownloaderEvent, EasyDownloaderState> {
  final GetVideoInfoUseCase getVideoInfoUseCase;
  final DownloadVideoUseCase downloadVideoUseCase;

  EasyDownloaderBloc(
      {required this.downloadVideoUseCase, required this.getVideoInfoUseCase})
      : super(EasyDownloaderInitial()) {
    on<EasyDownloaderEvent>((event, emit) {});
    on<GetVideoInfoEvent>(
      (event, emit) async {
        final video = await getVideoInfoUseCase.call(Params(link: event.link));
        video.fold(
          (l) => emit(EastyDoenloaderErrorState()),
          (r) => emit(EastyDoenloaderLoadedState()),
        );
      },
    );
  }
}
