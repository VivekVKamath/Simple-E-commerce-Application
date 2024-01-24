// ignore_for_file: must_be_immutable

part of 'image_bloc.dart';

@immutable
abstract class ImageEvent extends Equatable{
  const ImageEvent();
  @override
  List<Object> get props => [];
}
class AddImageEvent extends ImageEvent{
  dynamic gal;

  AddImageEvent({required this.gal});
  @override
  List<Object>  get props => [gal];
}

class ErrorImageEvent extends ImageEvent{
  dynamic gal;

  ErrorImageEvent({required this.gal});
  @override
  List<Object>  get props => [gal];
}

class LoadedImageEvent extends ImageEvent{
  dynamic gal;

  LoadedImageEvent({required this.gal});
  @override
  List<Object>  get props => [gal];
}