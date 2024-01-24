// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffgame4/dio/patchdio.dart';
import 'package:ffgame4/models/patch_model_class.dart';
import 'package:meta/meta.dart';

part 'patchdata_event.dart';
part 'patchdata_state.dart';

class PatchdataBloc extends Bloc<PatchdataEvent, PatchdataState> {
  late PatchDio patchDio;

  PatchdataBloc() : super(PatchdataInitial()) {
    patchDio = PatchDio();
    on<SuccessGetEvent>((event, emit) async {
      await mapSuccessGetEvent(event, emit);
    });
    on<SuccessPatchEvent>((event, emit) async {
      await mapSuccessPatchEvent(event, emit);
    });
  }


  Future<void> mapSuccessGetEvent(SuccessGetEvent event, Emitter<PatchdataState> emit) async{
    emit(const LoadingState());
    try {
      final response = await patchDio.getPhotos();
      var jsonDecoded = jsonDecode(response.body);



      if (response.statusCode == 200) {
        List<Users> users=[];
        for (int i = 0; i < jsonDecoded.length; i++) {
          users.add(Users.fromJson(jsonDecoded[i]));


        }
        emit(SuccessGetState(id:users, title: ''));
      }
      else{
        emit(ErrorState(photos: "a Something went wrong, try again"));
      }
    } catch (error) {
      emit(ErrorState(photos: "b Something went wrong, try again"));
      print(error);
    }
  }

  Future<void> mapSuccessPatchEvent(
      SuccessPatchEvent event, Emitter<PatchdataState> emit) async{

    try {
      final response = await patchDio.patchUsers(title:event.title,id: event.id);


      print("STATUS CODE IS ${response.statusCode}");

      if (response.statusCode == 200) {
        emit(SuccessPatchState(id:'', title: ''));
        print("success");
        }
      else{
        emit(ErrorState(photos: "c Something went wrong, try again"));
      }
    } catch (error) {
      emit(ErrorState(photos: "d Something went wrong, try again"));
      print(error);
    }
  }
}


