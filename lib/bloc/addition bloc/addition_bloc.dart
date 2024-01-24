// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'addition_event.dart';
part 'addition_state.dart';

class AdditionBloc extends Bloc<AdditionEvent,AdditionState>{
  AdditionBloc(): super(AdditionInitial()){

    on<AddTwoNumberEvent>((event, emit) async{
      await _mapAdditionEvent(event,emit);
    });
    on<SubtractTwoNumberEvent>((event, emit) async{
      await _mapSubtractEvent(event, emit);
    }
    );
    on<MultiplyTwoNumberEvent>((event, emit) async{
      await _mapMultiplyEvent(event, emit);
    }
    );
    on<DivideTwoNumberEvent>((event,emit) async{
      await _mapDivideEvent(event,emit);
    }
    );
  }


  Future<void> _mapAdditionEvent(
      AddTwoNumberEvent event, Emitter<AdditionState> emit) async{
    int sum=event.num1 + event.num2;
    emit(SumOfTwoNumbers(sum: sum));
  }
  Future<void> _mapSubtractEvent(
      SubtractTwoNumberEvent event, Emitter<AdditionState> emit) async{
    int sum=event.num1 - event.num2;
    emit(SumOfTwoNumbers(sum: sum));
  }
  Future<void> _mapMultiplyEvent(
      MultiplyTwoNumberEvent event, Emitter<AdditionState> emit) async{
    int sum=event.num1 * event.num2;
    emit(SumOfTwoNumbers(sum: sum));
  }
  Future<void> _mapDivideEvent(
      DivideTwoNumberEvent event,Emitter<AdditionState> emit) async{
    dynamic sum= event.num1/event.num2;
    emit(SumOfTwoNumbers(sum: sum));
  }
}
