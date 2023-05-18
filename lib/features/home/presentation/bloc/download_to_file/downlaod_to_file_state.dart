part of 'downlaod_to_file_bloc.dart';

abstract class DownlaodToFileState extends Equatable {
  const DownlaodToFileState();

  @override
  List<Object> get props => [];
}

class DownlaodToFileInitial extends DownlaodToFileState {}

class DownlaodToFileLoadingState extends DownlaodToFileState {}

class DownlaodToFileLoadedState extends DownlaodToFileState {}

class DownlaodToFileErrorState extends DownlaodToFileState {}
