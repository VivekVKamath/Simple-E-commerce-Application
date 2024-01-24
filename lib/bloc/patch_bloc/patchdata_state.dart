// ignore_for_file: must_be_immutable

part of 'patchdata_bloc.dart';

@immutable
abstract class PatchdataState extends Equatable{
  const PatchdataState();

  @override
  List<Object> get props => [];
}

class PatchdataInitial extends PatchdataState {}

class LoadingState extends PatchdataState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

class SuccessGetState extends PatchdataState {

  dynamic id;
  dynamic title;
  SuccessGetState({ required this.id, required this.title});

  @override
  List<Object> get props => [id,title];
}

class SuccessPatchState extends PatchdataState {

  dynamic id;
  dynamic title;
  SuccessPatchState({ required this.id, required this.title});

  @override
  List<Object> get props => [id,title];
}

class ErrorState extends PatchdataState {
  dynamic photos;
  ErrorState({required this.photos});

  @override
  List<Object> get props => [photos];
}