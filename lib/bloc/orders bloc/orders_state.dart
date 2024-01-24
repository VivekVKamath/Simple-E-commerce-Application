part of 'orders_bloc.dart';

@immutable
@immutable
abstract class OrdersState extends Equatable{
  const OrdersState();

  @override
  List<Object>  get props => [];
}

class OrdersInitial extends OrdersState {}

class OrderNumber extends OrdersState{
  dynamic ids;

  OrderNumber({required this.ids});

  @override
  List<Object>  get props => [ids];
}
