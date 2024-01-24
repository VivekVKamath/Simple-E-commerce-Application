// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffgame4/dio/postdio.dart';
import 'package:meta/meta.dart';



part 'addingdata_event.dart';
part 'addingdata_state.dart';

class AddingdataBloc extends Bloc<AddingdataEvent, AddingdataState> {
  late AddingDataDio addingDataDio;

  AddingdataBloc() : super(AddingdataInitial()) {
    addingDataDio = AddingDataDio();
    on<SuccessEvent>((event, emit) async {
      await _mapSuccessEvent(event, emit);
    });
  }

  Future<void> _mapSuccessEvent(
      SuccessEvent event, Emitter<AddingdataState> emit) async {
    emit(const LoadingState());
    try {
      final response = await AddingDataDio().postData(name: event.title);

      if (response.statusCode == 201) {
        dynamic response1 = jsonDecode(response.body);
        emit(SuccessState(id: response1['id'], title: response1['title']));
      }
      else {
        emit(ErrorState(photos: "Something went wrong, try again"));
      }
    } catch (error) {
      emit(ErrorState(photos: "Something went wrong, try again"));
    }
  }
}
