// ignore_for_file: must_be_immutable

part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent extends Equatable {
  const PhotosEvent();
  @override
  List<Object> get props => [];
}

class AddPhotosEvent extends PhotosEvent {
  dynamic pics;

  AddPhotosEvent({this.pics});
  @override
  List<Object> get props => [pics];
}

class NewEvent extends PhotosEvent
{
  final dynamic id;


  const NewEvent({required this.id});

  @override
  List<Object> get props => [id];
}
