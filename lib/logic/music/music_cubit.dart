import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music/models/music_model.dart';
import 'package:music/repository/api_repository.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final ApiRepository apiRepository;
  MusicCubit({required this.apiRepository}) : super(MusicInitial());

  getMusics() async {
    try {
      emit(MusicLoading());

      var res = await apiRepository.getMusic();

      if (res['status'] == "ok") {
        var data = res['data'] as MusicModel;

        emit(MusicLoaded(musics: data.music));
      } else {
        emit(MusicLoadError(error: res['message']));
      }
    } catch (e) {
      emit(MusicLoadError(error: e.toString()));
    }
  }
}
