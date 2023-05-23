part of 'downlaod_to_file_bloc.dart';

abstract class DownlaodToFileState extends Equatable {
  const DownlaodToFileState();

  @override
  List<Object> get props => [];
}

class DownloadToFileInitial extends DownlaodToFileState {}

class DownloadToFileLoadingState extends DownlaodToFileState {
  final int progress;
  const DownloadToFileLoadingState({required this.progress});
  @override
  List<Object> get props => [];
}

class DownloadToFileLoadedState extends DownlaodToFileState {}

class DownloadToFileErrorState extends DownlaodToFileState {}
