// ignore_for_file: must_be_immutable

part of 'photos_bloc.dart';

@immutable
abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}

class LoadingState extends PhotosState {
  const LoadingState();
}

class AddPhotosState extends PhotosState {
  List<Photos> photos;
  AddPhotosState({required this.photos});

  @override
  List<Object> get props => [photos];
}

class ErrorState extends PhotosState {
  dynamic photos;
  dynamic id;

  ErrorState({required this.photos,required this.id});

  @override
  List<Object> get props => [photos,id];
}

class NewState extends PhotosState
{
  List newp;

  NewState({required this.newp});

  @override
  List<Object> get props => [newp];

}