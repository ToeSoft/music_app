import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Api/ResponseEntry/ArtistSongsResult.dart' as ArtistSongs;
import '../Api/ResponseEntry/PlaylistSongsResult.dart' as PlaylistSongs;
import '../Api/ResponseEntry/Song.dart' as SingleSong;
import 'MusicPlayerBloc.dart';
import 'MusicPlayerEvent.dart';

addSong<T>(BuildContext context, T song) {
  SingleSong.Song mapToSingleSong(dynamic song) {
    if (song is SingleSong.Song) {
      return song;
    }
    if (song is ArtistSongs.Songs || song is PlaylistSongs.Songs) {
      return SingleSong.Song(
        id: song.id,
        name: song.name,
        ar: [
          SingleSong.Ar(name: song.ar?.map((e) => e.name).join(' / ') ?? "")
        ],
        al: SingleSong.Al(
          picUrl: song.al?.picUrl ?? '',
          name: song.al?.name ?? '',
        ),
      );
    }
    throw ArgumentError('Unsupported type: ${song.runtimeType}');
  }

  try {
    final singleSong = mapToSingleSong(song);
    context.read<MusicPlayerBloc>().add(InsertIntoQueueEvent(singleSong));
  } catch (e) {
    debugPrint('Failed to add song: $e');
  }
}

removeSong(BuildContext context, int index) {
  context.read<MusicPlayerBloc>().add(RemoveFromQueueEvent(index));
}

togglePlaylistDialog(BuildContext context) {
  context.read<MusicPlayerBloc>().add(TogglePlaylistEvent());
}

toggleShuffle(BuildContext context) {
  context.read<MusicPlayerBloc>().add(ToggleShuffleEvent());
}

togglePlayPause(BuildContext context) {
  context.read<MusicPlayerBloc>().add(TogglePlayPauseEvent());
}

changeLoopMode(BuildContext context) {
  context.read<MusicPlayerBloc>().add(ChangeLoopModeEvent());
}


updateProgress(BuildContext context, double position) {
  context.read<MusicPlayerBloc>().add(UpdateProgressEvent(position));
}

nextTrack(BuildContext context) {
  context.read<MusicPlayerBloc>().add(NextTrackEvent());
}

previousTrack(BuildContext context) {
  context.read<MusicPlayerBloc>().add(PreviousTrackEvent());
}


