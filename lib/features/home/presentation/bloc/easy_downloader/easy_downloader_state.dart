part of 'easy_downloader_bloc.dart';

abstract class EasyDownloaderState extends Equatable {
  const EasyDownloaderState();

  @override
  List<Object> get props => [];
}

class EasyDownloaderInitial extends EasyDownloaderState {}

class EastyDoenloaderLoadingState extends EasyDownloaderState {}

class EastyDoenloaderLoadedState extends EasyDownloaderState {}

class EastyDoenloaderErrorState extends EasyDownloaderState {}
