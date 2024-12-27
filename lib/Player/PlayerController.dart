import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Api/HttpClient.dart';
import '../Api/RequestEntry/MusicRequestParams.dart';
import '../Api/ResponseEntry/ArtistSongsResult.dart' as ArtistSongs;
import '../Api/ResponseEntry/PlaylistSongsResult.dart' as PlaylistSongs;
import '../Api/ResponseEntry/Song.dart' as SingleSong;
import 'MusicPlayerBloc.dart';
import 'MusicPlayerEvent.dart';
import 'PlayerBar.dart';

addToList<T>(BuildContext context, T song) {
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
    context.read<MusicPlayerBloc>().add(AddIntoQueueEvent(singleSong));
  } catch (e) {
    debugPrint('Failed to add song: $e');
  }
}

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

addPlaylist<T>(BuildContext context, List<T> playlist, int playIndex) {
  List<SingleSong.Song> mapToSingleSongList(List<T> playlist) {
    return playlist.map((e) {
      if (e is SingleSong.Song) {
        return e;
      }
      if (e is ArtistSongs.Songs) {
        return SingleSong.Song(
          id: e.id,
          name: e.name,
          ar: [SingleSong.Ar(name: e.ar?.map((e) => e.name).join(' / ') ?? "")],
          al: SingleSong.Al(
            picUrl: e.al?.picUrl ?? '',
            name: e.al?.name ?? '',
          ),
        );
      }
      if (e is PlaylistSongs.Songs) {
        return SingleSong.Song(
          id: e.id,
          name: e.name,
          ar: [SingleSong.Ar(name: e.ar?.map((e) => e.name).join(' / ') ?? "")],
          al: SingleSong.Al(
            picUrl: e.al?.picUrl ?? '',
            name: e.al?.name ?? '',
          ),
        );
      }
      throw ArgumentError('Unsupported type: ${e.runtimeType}');
    }).toList();
  }

  context.read<MusicPlayerBloc>().add(InsertPlaylistIntoQueueEvent(
        mapToSingleSongList(playlist),
        playIndex,
      ));
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

setDuration(BuildContext context, double duration) {
  context.read<MusicPlayerBloc>().add(SetDurationEvent(duration));
}

nextTrack(BuildContext context) {
  context.read<MusicPlayerBloc>().add(NextTrackEvent());
}

previousTrack(BuildContext context) {
  context.read<MusicPlayerBloc>().add(PreviousTrackEvent());
}

playMusic(String id) async {
  final http = HTTP.getClient<MusicClient>();
  var result = await http.getMusic(getMusicParams(id));
  player.play(UrlSource(result.urlInfo?.url ?? ""));
}

play(BuildContext context, SingleSong.Song song) async {
  context.read<MusicPlayerBloc>().add(PlayEvent(song));
}

onPlayCompletion(BuildContext context) {
  context.read<MusicPlayerBloc>().add(OnPlayCompletionEvent());
}
