// ignore_for_file: must_be_immutable

part of 'image_bloc.dart';

@immutable
abstract class ImageState extends Equatable{
  const ImageState();

  @override
  List<Object>  get props => [];
}

class ImageInitial extends ImageState {}
class GalleryImages extends ImageState{
  dynamic images;

  GalleryImages({required this.images});

  @override
  List<Object>  get props => [images];
}

class ErrorImages extends ImageState{
  dynamic images;

  ErrorImages({required this.images});

  @override
  List<Object>  get props => [images];
}

class LoadedImages extends ImageState{
  dynamic images;

  LoadedImages({required this.images});

  @override
  List<Object>  get props => [images];
}