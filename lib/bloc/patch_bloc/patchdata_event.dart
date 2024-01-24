// ignore_for_file: must_be_immutable

part of 'patchdata_bloc.dart';

@immutable
abstract class PatchdataEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class SuccessGetEvent extends PatchdataEvent {
  dynamic title;
  dynamic id;

  SuccessGetEvent({required this.title,required this.id});
  @override
  List<Object> get props => [title,id];
}

class SuccessPatchEvent extends PatchdataEvent {
  dynamic title;
  dynamic id;
  SuccessPatchEvent({required this.title,required this.id});
  @override
  List<Object> get props => [title,id];
}
