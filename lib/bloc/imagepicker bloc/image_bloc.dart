// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {

    on<AddImageEvent>((event, emit) async{
      await _mapImageEvent(event, emit);
    });
    on<ErrorImageEvent>((event, emit) async{
      await _mapErrorImageEvent(event, emit);
    });
    on<LoadedImageEvent>((event, emit) async{
      await _mapLoadedImageEvent(event, emit);
    });
  }

  Future<void> _mapImageEvent(
      AddImageEvent event, Emitter<ImageState> emit) async {
    dynamic images= event.gal;
    emit(GalleryImages(images: images));
  }
  Future<void> _mapErrorImageEvent(
      ErrorImageEvent event, Emitter<ImageState> emit) async {
    dynamic images= event.gal;
    emit(ErrorImages(images: images));
  }
  Future<void> _mapLoadedImageEvent(
      LoadedImageEvent event, Emitter<ImageState> emit) async {
    dynamic images= event.gal;
    emit(LoadedImages(images: images));
  }
}
