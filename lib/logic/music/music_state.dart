// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'music_cubit.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final List<Music> musics;
 const MusicLoaded({
    required this.musics,
  });

  @override
  List<Object> get props => [musics];
}

class MusicLoadError extends MusicState {
  final String error;
 const MusicLoadError({
    required this.error,
  });

   @override
  List<Object> get props => [error];
}



