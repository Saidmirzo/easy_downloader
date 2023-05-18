import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'downlaod_to_file_event.dart';
part 'downlaod_to_file_state.dart';

class DownlaodToFileBloc
    extends Bloc<DownlaodToFileEvent, DownlaodToFileState> {
  DownlaodToFileBloc() : super(DownlaodToFileInitial()) {
    on<DownlaodToFileEvent>((event, emit) {});
    on<SaveToFileEvent>(
      (event, emit) {},
    );
  }
}
