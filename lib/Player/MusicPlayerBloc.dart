import 'package:flutter_bloc/flutter_bloc.dart';

import 'MusicPlayerEvent.dart';
import 'MusicPlayerState.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc()
      : super(const MusicPlayerState(
    queue: ["1","1","1","1","1","1"],
          isShuffleActive: false,
          isPlaying: false,
          loopMode: 0,
          currentPosition: 0.0,
          totalDuration: 200.0,
          showPlaylistDialog: false,
        )) {
    on<ToggleShuffleEvent>((event, emit) {
      emit(state.copyWith(isShuffleActive: !state.isShuffleActive));
    });

    on<TogglePlayPauseEvent>((event, emit) {
      emit(state.copyWith(isPlaying: !state.isPlaying));
    });

    on<ChangeLoopModeEvent>((event, emit) {
      emit(state.copyWith(loopMode: (state.loopMode + 1) % 3));
    });

    on<UpdateProgressEvent>((event, emit) {
      emit(state.copyWith(currentPosition: event.position));
    });

    on<NextTrackEvent>((event, emit) {
      emit(state.copyWith(isPlaying: !state.isPlaying));
    });

    on<PreviousTrackEvent>((event, emit) {
      emit(state.copyWith(isPlaying: !state.isPlaying));
    });

    on<TogglePlaylistEvent>((event, emit) {
      emit(state.copyWith(showPlaylistDialog: !state.showPlaylistDialog));
    });
  }
}
