part of 'downlaod_to_file_bloc.dart';

abstract class DownlaodToFileEvent extends Equatable {
  const DownlaodToFileEvent();

  @override
  List<Object> get props => [];
}

class SaveToFileEvent extends DownlaodToFileEvent{
  
}

