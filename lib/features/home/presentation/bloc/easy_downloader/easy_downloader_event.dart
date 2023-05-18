part of 'easy_downloader_bloc.dart';

abstract class EasyDownloaderEvent extends Equatable {
  const EasyDownloaderEvent();

  @override
  List<Object> get props => [];
}

class GetVideoInfoEvent extends EasyDownloaderEvent {
  final String link;
  const GetVideoInfoEvent({required this.link});
}
