part of 'downlaod_to_file_bloc.dart';

abstract class DownloadToFileEvent extends Equatable {
  const DownloadToFileEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SaveToFileEvent extends DownloadToFileEvent {
  String? name;
  VideoModel videoModel;
  SaveToFileEvent({required this.videoModel, this.name});
}

class EmitLoadingEvent extends DownloadToFileEvent {
  final int progress;
  const EmitLoadingEvent({required this.progress});
}

class InitialEvent extends DownloadToFileEvent {}
class EmitLoadedEvent extends DownloadToFileEvent {}
class EmitErrorEvent extends DownloadToFileEvent {}
