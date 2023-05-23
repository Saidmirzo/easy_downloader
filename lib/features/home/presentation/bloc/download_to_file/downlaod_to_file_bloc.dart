import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/usecases/download_to_file_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/get_gallary_path.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

part 'downlaod_to_file_event.dart';
part 'downlaod_to_file_state.dart';

class DownloadToFileBloc
    extends Bloc<DownloadToFileEvent, DownlaodToFileState> {
  ReceivePort receivePort = ReceivePort();
  int progress = 0;
  int count = 0;

  final GetGallaryPathUseCase getGallaryPathUseCase;
  final DownloadToFileUseCase downloadToFileUseCase;

  DownloadToFileBloc({
    required this.downloadToFileUseCase,
    required this.getGallaryPathUseCase,
  }) : super(DownloadToFileInitial()) {
    on<InitialEvent>(
      (event, emit) {
        _bindBackgroundIsolate();
        FlutterDownloader.registerCallback(downloadCallBack);
      },
    );
    on<DownloadToFileEvent>((event, emit) {});
    on<SaveToFileEvent>(
      (event, emit) async {
        // emit(const DownloadToFileLoadingState(progress: 0));
        final pathResult = await getGallaryPathUseCase.call(NoParams());
        pathResult.fold(
          (l) => emit(DownloadToFileErrorState()),
          (filePath) async {
            final idResult = await downloadToFileUseCase.call(
              DownloadFileParams(
                filePath: filePath,
                link: event.videoModel.url!,
                name:
                    "${event.videoModel.url!.substring(8, 20)}($count).${event.videoModel.container ?? "mp4"}",
              ),
            );
            count++;
          },
        );
      },
    );
    on<EmitLoadingEvent>(
      (event, emit) {
        emit(DownloadToFileLoadedState());
        emit(DownloadToFileLoadingState(progress: event.progress));
      },
    );
    on<EmitErrorEvent>(
      (event, emit) => emit(DownloadToFileErrorState()),
    );
    on<EmitLoadedEvent>(
      (event, emit) => emit(DownloadToFileLoadedState()),
    );
  }

  static downloadCallBack(id, status, progress) {
    final SendPort sendPort =
        IsolateNameServer.lookupPortByName("downloadvideo")!;
    sendPort.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloadvideo');
  }

  void _bindBackgroundIsolate() {
    final isSuccsess = IsolateNameServer.registerPortWithName(
        receivePort.sendPort, "downloadvideo");
    if (!isSuccsess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    } else {
      receivePort.listen((message) {
        final id = message[0];
        final status = message[1];
        final progress = message[2];

        if (status == 4||status==5) {
          add(EmitErrorEvent());
        }else
        if (status == DownloadTaskStatus.complete.value) {
          add(EmitLoadedEvent());
        } else {
          this.progress = progress;
          add(EmitLoadingEvent(progress: progress));
        }
      });
    }
  }
}
