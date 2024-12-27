import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Player/PlayerController.dart';

import '../Api/ResponseEntry/Song.dart';
import '../AppConfig/AppConfigBloc.dart';
import 'MusicPlayerEvent.dart';
import 'MusicPlayerState.dart';
import 'PlayerBar.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc()
      : super(const MusicPlayerState(
          queue: [],
          isShuffleActive: false,
          isPlaying: false,
          loopMode: 0,
          currentPosition: 0.0,
          totalDuration: 0.0,
          showPlaylistDialog: false,
          currentSong: null,
          isLoaded: false,
        )) {
    on<InitializeAppEvent>(_onInitializeApp);

    on<ToggleShuffleEvent>((event, emit) {
      asyncPrefs.setBool('isShuffleActive', !state.isShuffleActive);
      emit(state.copyWith(isShuffleActive: !state.isShuffleActive));
    });

    on<TogglePlayPauseEvent>((event, emit) {
      if (state.isPlaying) {
        player.pause();
      } else {
        player.resume();
      }
      emit(state.copyWith(isPlaying: !state.isPlaying));
    });

    on<ChangeLoopModeEvent>((event, emit) {
      asyncPrefs.setInt('loopMode', (state.loopMode + 1) % 3);
      emit(state.copyWith(loopMode: (state.loopMode + 1) % 3));
    });

    on<UpdateProgressEvent>((event, emit) {
      emit(state.copyWith(currentPosition: event.position));
    });

    on<NextTrackEvent>((event, emit) {
      if (state.currentSong == null) {
        return;
      }
      //如果是随机播放
      if (state.isShuffleActive) {
        var random = Random();
        int min = 0;
        int max = state.queue.length - 1;
        int randomNumber = min + random.nextInt(max - min + 1);
        final randomIndex = state.queue.length > 1 ? randomNumber : 0;
        playMusic(state.queue[randomIndex].id.toString());
        emit(state.copyWith(
            currentSong: state.queue[randomIndex], isPlaying: true));
        return;
      }

      //如果是顺序播放
      final nextIndex = state.queue.indexOf(state.currentSong!) + 1;
      if (nextIndex >= state.queue.length) {
        player.stop();
        emit(state.copyWith(isPlaying: false, currentSong: null));
        return;
      }
      playMusic(state.queue[nextIndex].id.toString());
      emit(
          state.copyWith(currentSong: state.queue[nextIndex], isPlaying: true));
    });

    on<PreviousTrackEvent>((event, emit) {
      //如果是随机播放
      if (state.isShuffleActive) {
        var random = Random();
        int min = 0;
        int max = state.queue.length - 1;
        int randomNumber = min + random.nextInt(max - min + 1);
        final randomIndex = state.queue.length > 1 ? randomNumber : 0;
        playMusic(state.queue[randomIndex].id.toString());
        emit(state.copyWith(
            currentSong: state.queue[randomIndex], isPlaying: true));
        return;
      }

      //如果是顺序播放
      final previousIndex = state.queue.indexOf(state.currentSong!) - 1;
      if (previousIndex < 0) {
        player.stop();
        emit(state.copyWith(isPlaying: false, currentSong: null));
        return;
      }
      playMusic(state.queue[previousIndex].id.toString());
      emit(state.copyWith(
          currentSong: state.queue[previousIndex], isPlaying: true));
    });

    on<TogglePlaylistEvent>((event, emit) {
      emit(state.copyWith(showPlaylistDialog: !state.showPlaylistDialog));
    });

    on<InsertIntoQueueEvent>((event, emit) async {
      //如果有相同的歌曲，则不添加直接播放
      if (state.queue.any((element) => element.id == event.song.id)) {
        playMusic(event.song.id.toString());
        emit(state.copyWith(
          currentSong: event.song,
          isPlaying: true,
        ));
        return;
      }

      if (state.queue.isEmpty) {
        playMusic(event.song.id.toString());
        emit(state.copyWith(
          queue: [event.song],
          currentSong: event.song,
          isPlaying: true,
        ));
        return;
      }

      //在当前播放的歌曲后面添加并播放
      final newQueue = List<Song>.from(state.queue);
      newQueue.insert(state.queue.indexOf(state.currentSong!) + 1, event.song);
      playMusic(event.song.id.toString());

      emit(state.copyWith(
        queue: newQueue,
        currentSong: event.song,
        isPlaying: true,
      ));
    });

    on<AddIntoQueueEvent>((event, emit) async {
      //如果有相同的歌曲，则不添加
      if (state.queue.any((element) => element.id == event.song.id)) {
        return;
      }

      final newQueue = List<Song>.from(state.queue);
      newQueue.add(event.song);
      emit(state.copyWith(queue: newQueue));
    });

    on<InsertPlaylistIntoQueueEvent>((event, emit) async {
      // 清空队列并添加新的歌曲列表
      final newQueue = List<Song>.from(event.songs);

      if (event.playIndex != -1) {
        playMusic(event.songs[event.playIndex].id.toString());
        emit(state.copyWith(
          queue: newQueue,
          currentSong: event.songs[event.playIndex],
          isPlaying: true,
        ));
        return;
      }

      emit(state.copyWith(queue: newQueue));
    });

    on<RemoveFromQueueEvent>((event, emit) {
      final newQueue = List<Song>.from(state.queue);
      newQueue.removeAt(event.index);
      emit(state.copyWith(queue: newQueue));
    });

    on<SetDurationEvent>((setDurationEvent, emit) {
      emit(state.copyWith(totalDuration: setDurationEvent.duration));
    });

    on<PlayEvent>((event, emit) {
      playMusic(event.song.id.toString());
      emit(state.copyWith(isPlaying: true, currentSong: event.song));
    });

    on<OnPlayCompletionEvent>((event, emit) {
      if (state.currentSong == null) return;

      final currentIndex = state.queue.indexOf(state.currentSong!);
      final isLastSong = currentIndex == state.queue.length - 1;

      if (state.loopMode == 0) {
        // 列表不循环
        if (isLastSong) {
          player.stop();
          emit(state.copyWith(isPlaying: false, currentSong: null));
        } else {
          add(NextTrackEvent());
        }
      } else if (state.loopMode == 1) {
        // 列表循环
        if (isLastSong) {
          playMusic(state.queue[0].id.toString());
          emit(state.copyWith(currentSong: state.queue[0], isPlaying: true));
        } else {
          add(NextTrackEvent());
        }
      } else if (state.loopMode == 2) {
        // 单曲循环
        playMusic(state.currentSong!.id.toString());
      }
    });

    // 延迟触发初始化事件以确保构造完成后再调用
    Future.microtask(() => add(InitializeAppEvent()));
  }

  // 处理初始化事件，获取版本信息
  Future<void> _onInitializeApp(
      InitializeAppEvent event, Emitter<MusicPlayerState> emit) async {
    // //currentSong
    // final String? currentSongJsonString =
    //     await asyncPrefs.getString('currentSongId');
    // if (currentSongJsonString != null) {
    //   // 解析 JSON 字符串为 Map
    //   final Map<String, dynamic> jsonMap = json.decode(currentSongJsonString);
    //   // 使用 Song.fromJson 方法创建 Song 实例
    //   final song = Song.fromJson(jsonMap);
    //   emit(state.copyWith(currentSong: song));
    // }
    //
    // //queue
    // final String? queueJsonString = await asyncPrefs.getString('queue');
    // if (queueJsonString != null) {
    //   final List<dynamic> jsonList = json.decode(queueJsonString);
    //   final List<Song> queue = jsonList.map((e) => Song.fromJson(e)).toList();
    //   emit(state.copyWith(queue: queue));
    // }

    //是否随机播放
    final bool? isShuffleActive = await asyncPrefs.getBool('isShuffleActive');

    //循环模式
    final int? loopMode = await asyncPrefs.getInt('loopMode');

    emit(state.copyWith(
      isShuffleActive: isShuffleActive ?? false,
      loopMode: loopMode ?? 0,
    ));
  }
}
