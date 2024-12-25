import 'package:equatable/equatable.dart';
import 'package:music_app/Api/ResponseEntry/Song.dart';

class MusicPlayerState extends Equatable {
  final bool isShuffleActive;
  final bool isPlaying;
  final int loopMode;
  final double currentPosition;
  final double totalDuration;
  final List<Song> queue;
  final bool showPlaylistDialog;

  const MusicPlayerState({
    required this.showPlaylistDialog,
    required this.queue,
    required this.isShuffleActive,
    required this.isPlaying,
    required this.loopMode,
    required this.currentPosition,
    required this.totalDuration,
  });

  MusicPlayerState copyWith({
    List<Song>? queue,
    bool? isShuffleActive,
    bool? isPlaying,
    int? loopMode,
    double? currentPosition,
    double? totalDuration,
    bool? showPlaylistDialog,
  }) {
    return MusicPlayerState(
      queue: queue ?? this.queue,
      isShuffleActive: isShuffleActive ?? this.isShuffleActive,
      isPlaying: isPlaying ?? this.isPlaying,
      loopMode: loopMode ?? this.loopMode,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
      showPlaylistDialog: showPlaylistDialog ?? this.showPlaylistDialog,
    );
  }

  @override
  List<Object?> get props =>
      [isShuffleActive, isPlaying, loopMode, currentPosition, totalDuration, queue, showPlaylistDialog];
}