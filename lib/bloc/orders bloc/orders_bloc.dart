// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
    on<AddOrdersEvent>((event, emit) async{
      await _mapOrdersEvent(event, emit);
    });
  }
  Future<void> _mapOrdersEvent(
      AddOrdersEvent event, Emitter<OrdersState> emit) async {
    dynamic ids= event.ord;
    emit(OrderNumber(ids:ids));
  }
}
