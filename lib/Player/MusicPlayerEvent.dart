import 'package:equatable/equatable.dart';
import 'package:music_app/Api/ResponseEntry/Song.dart';

abstract class MusicPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleShuffleEvent extends MusicPlayerEvent {}

class TogglePlayPauseEvent extends MusicPlayerEvent {}

class ChangeLoopModeEvent extends MusicPlayerEvent {}

class UpdateProgressEvent extends MusicPlayerEvent {
  final double position;

  UpdateProgressEvent(this.position);

  @override
  List<Object?> get props => [position];
}

class SetDurationEvent extends MusicPlayerEvent {
  final double duration;

  SetDurationEvent(this.duration);

  @override
  List<Object?> get props => [duration];
}

class NextTrackEvent extends MusicPlayerEvent {}

class PreviousTrackEvent extends MusicPlayerEvent {}

class TogglePlaylistEvent extends MusicPlayerEvent {}

class InsertIntoQueueEvent extends MusicPlayerEvent {
  final Song song;

  InsertIntoQueueEvent(this.song);

  @override
  List<Object?> get props => [song];
}

class RemoveFromQueueEvent extends MusicPlayerEvent {
  final int index;

  RemoveFromQueueEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class InsertPlaylistIntoQueueEvent extends MusicPlayerEvent {
  final List<Song> songs;
  final int playIndex;

  InsertPlaylistIntoQueueEvent(this.songs, this.playIndex);

  @override
  List<Object?> get props => [songs];
}

class PlayEvent extends MusicPlayerEvent {
  final Song song;

  PlayEvent(this.song);

  @override
  List<Object?> get props => [song];
}


class AddIntoQueueEvent extends MusicPlayerEvent {
  final Song song;

  AddIntoQueueEvent(this.song);

  @override
  List<Object?> get props => [song];
}


class OnPlayCompletionEvent extends MusicPlayerEvent {}


class InitializeAppEvent extends MusicPlayerEvent {
  InitializeAppEvent();
}