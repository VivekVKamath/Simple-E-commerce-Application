// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:ffgame4/dio/getdio.dart';
import 'package:ffgame4/models/get_model_class.dart';
import 'package:meta/meta.dart';
part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  late PhotosDio photosDio;
  PhotosBloc() : super(PhotosInitial()) {
    photosDio = PhotosDio();

    on<AddPhotosEvent>((event, emit) async {
      await _mapPhotosEvent(event, emit);
    });

    on<NewEvent>((event, emit) async {
      await _mapNewEvent(event, emit);
    });
  }

  Future<void> _mapPhotosEvent(
      AddPhotosEvent event, Emitter<PhotosState> emit) async {
    emit(const LoadingState());

    try {
      final response = await photosDio.getPhotos();

      var jsonDecoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Photos> photos = [];

        for (int i = 0; i < jsonDecoded.length; i++) {
          photos.add(Photos.fromJson(jsonDecoded[i]));
        }
        emit(AddPhotosState(photos: photos));
      } else {
        emit(ErrorState(photos: "Something went wrong",id: ''));
      }
    } catch (error) {
      emit(ErrorState(photos: "Something went wrong",id: ''));
    }
  }

  Future<void> _mapNewEvent(
      NewEvent event, Emitter<PhotosState> emit) async {
    emit(const LoadingState());
    try{
      final response = await photosDio.singlePhoto(id: event.id);

      var jsonDecoded = jsonDecode(response.body);

      if(response.statusCode == 200){
        List newp = [];
        newp.add(Photos.fromJson(jsonDecoded));
        emit(NewState(newp: newp));
      }
      else{
        emit(ErrorState(photos: "Something went wrong",id: event.id));
      }
    }
    catch(error){
      emit(ErrorState(photos: "Something went wrong",id: event.id));
    }
  }
}
