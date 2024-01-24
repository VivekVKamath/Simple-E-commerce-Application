// ignore_for_file: must_be_immutable

part of 'addingdata_bloc.dart';

@immutable
abstract class AddingdataEvent extends Equatable{
  const AddingdataEvent();
  @override
  List<Object> get props => [];
}
class SuccessEvent extends AddingdataEvent {
  dynamic title;

  SuccessEvent({this.title});
  @override
  List<Object> get props => [title];
}
