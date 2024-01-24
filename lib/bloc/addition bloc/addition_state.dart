// ignore_for_file: must_be_immutable

part of 'addition_bloc.dart';

@immutable
abstract class AdditionState extends Equatable{
  const AdditionState();

  @override
  List<Object>  get props => [];
}

class AdditionInitial extends AdditionState {}
class SumOfTwoNumbers extends AdditionState{
  dynamic sum;

  SumOfTwoNumbers({required this.sum});

  @override
  List<Object>  get props => [sum];
}

