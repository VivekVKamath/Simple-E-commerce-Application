// ignore_for_file: must_be_immutable

part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent extends Equatable{
  const OrdersEvent();
  @override
  List<Object> get props => [];
}
class AddOrdersEvent extends OrdersEvent{
  dynamic ord;
  AddOrdersEvent({required this.ord});
  @override
  List<Object>  get props => [ord];
}
