import 'package:bloc/bloc.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:easy_downloader/features/home/domain/usecases/delete_from_box_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/download_video_usecase.dart';
import 'package:easy_downloader/features/home/domain/usecases/get_to_box_usecase.dart';
import 'package:equatable/equatable.dart';

import '../easy_downloader/easy_downloader_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetToBoxUseCase getToBoxUseCase;
  final DeleteFromBoxUseCase deleteFromBoxUseCase;

  HistoryBloc(
      {required this.deleteFromBoxUseCase, required this.getToBoxUseCase})
      : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) {});
    on<GetToBoxEvent>((event, emit) async {
      emit(HistoryLoadingState());
      final result = await getToBoxUseCase.call(GetBoxParams(boxName: boxName));
      result.fold(
        (l) => emit(HistoryErrorState()),
        (list) => emit(HistoryLoadedState(listVideo: list)),
      );
    });
    on<DeleteFromBoxEvent>(
      (event, emit) async {
        emit(HistoryLoadingState());
        final result = await deleteFromBoxUseCase
            .call(DeleteBoxParams(boxName: boxName, index: event.index));
        add(GetToBoxEvent());
      },
    );
  }
}
