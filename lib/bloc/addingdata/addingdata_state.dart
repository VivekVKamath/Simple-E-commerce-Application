// ignore_for_file: must_be_immutable

part of 'addingdata_bloc.dart';

@immutable
abstract class AddingdataState extends Equatable {
  const AddingdataState();

  @override
  List<Object> get props => [];
}

class AddingdataInitial extends AddingdataState {}

class LoadingState extends AddingdataState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class SuccessState extends AddingdataState {

  dynamic id;
  dynamic title;
  SuccessState({ required this.id, required this.title});

  @override
  List<Object> get props => [id,title];
}

class ErrorState extends AddingdataState {
  dynamic photos;
  ErrorState({required this.photos});

  @override
  List<Object> get props => [photos];
}
