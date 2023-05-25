part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class GetToBoxEvent extends HistoryEvent {}

class SaveToBoxEvent extends HistoryEvent {}

class DeleteFromBoxEvent extends HistoryEvent {
  final int index;
  const DeleteFromBoxEvent({required this.index});
}
