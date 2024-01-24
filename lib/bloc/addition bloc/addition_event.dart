// ignore_for_file: must_be_immutable

part of 'addition_bloc.dart';

@immutable
abstract class AdditionEvent extends Equatable{
  const AdditionEvent();

  @override
  List<Object>  get props => [];
}
class AddTwoNumberEvent extends AdditionEvent{
  int num1;
  int num2;

  AddTwoNumberEvent({required this.num1, required this.num2});
  @override
  List<Object>  get props => [num1,num2];
}

class SubtractTwoNumberEvent extends AdditionEvent{
  int num1;
  int num2;

  SubtractTwoNumberEvent({required this.num1, required this.num2});
  @override
  List<Object>  get props => [num1,num2];
}

class MultiplyTwoNumberEvent extends AdditionEvent{
  int num1;
  int num2;

  MultiplyTwoNumberEvent({required this.num1, required this.num2});
  @override
  List<Object>  get props => [num1,num2];
}

class DivideTwoNumberEvent extends AdditionEvent{
  dynamic num1;
  dynamic num2;

  DivideTwoNumberEvent({required this.num1, required this.num2});
  @override
  List<Object>  get props => [num1,num2];
}
