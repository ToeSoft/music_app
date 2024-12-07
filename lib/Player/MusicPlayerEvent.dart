import 'package:equatable/equatable.dart';

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

class NextTrackEvent extends MusicPlayerEvent {}

class PreviousTrackEvent extends MusicPlayerEvent {}

class TogglePlaylistEvent extends MusicPlayerEvent {}
