part of 'easy_downloader_bloc.dart';

abstract class EasyDownloaderState extends Equatable {
  const EasyDownloaderState();

  @override
  List<Object> get props => [];
}

class EasyDownloaderInitial extends EasyDownloaderState {}

class EasyDownloaderLoadingState extends EasyDownloaderState {}

class EasyDownloaderLoadedState extends EasyDownloaderState {
  final VideoModel videoModel;
  const EasyDownloaderLoadedState({required this.videoModel});
  @override
  List<Object> get props => [videoModel];
}

class EasyDownloaderErrorState extends EasyDownloaderState {}
