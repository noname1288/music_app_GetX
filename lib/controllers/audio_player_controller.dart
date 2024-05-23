import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app_test_getx/model/song_model.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerController {
  final AudioPlayer _audioPlayer = AudioPlayer(); // tạo một đối tượng AudioPlayer
  final BehaviorSubject<Duration?> _positionSubject = BehaviorSubject<Duration?>(); // tạo một đối tượng BehaviorSubject để lưu trữ vị trí của audio
  final BehaviorSubject<bool> _playingSubject = BehaviorSubject<bool>.seeded(false); // tạo một đối tượng BehaviorSubject để lưu trữ trạng thái phát của audio || false = im
  int _replayCounter = 0;

  //final SongModel ?song;
  //bool _isDisposed = false;
  
  Stream<Duration?> get positionStream => _positionSubject.stream; // getter trả về vị trí hiện tại của audio
  Stream<bool> get playingStream => _playingSubject.stream; // getter trả về trạng thái phát của audio

  // AudioPlayerController({this.song}) {
    
  //   _audioPlayer.positionStream.listen((position) { // lắng nghe sự kiện thay đổi thời gian
  //     _positionSubject.add(position); // cập nhật thời gian hiện tại vào BehaviorSubject
  //   });
  //   _audioPlayer.playerStateStream.listen((state) { // lắng nghe sự kiện thay đổi trạng thái
  //     _playingSubject.add(state.playing); // cập nhật trạng thái hiện tại vào BehaviorSubject
  //   });
  // }

  AudioPlayerController() {
    
    _audioPlayer.positionStream.listen((position) { // lắng nghe sự kiện thay đổi thời gian
      _positionSubject.add(position); // cập nhật thời gian hiện tại vào BehaviorSubject
    });
    _audioPlayer.playerStateStream.listen((state) { // lắng nghe sự kiện thay đổi trạng thái
      _playingSubject.add(state.playing); // cập nhật trạng thái hiện tại vào BehaviorSubject
    });
  }

  AudioPlayer get audioPlayer => _audioPlayer; // getter trả về audio hiện tại
  //bool get getIsDisposed => _isDisposed; // getter trả về trạng thái dispose
  int get get_replayCounter => _replayCounter; // getter trả về số lần click
  void set set_replayCounter(int value) => _replayCounter = value; // setter cập nhật số lần click

  Future<void> load(String assetPath) async {
    final bytes = await rootBundle.load(assetPath); // sử dụng tệp âm thanh từ thư mục assets
    final audioBytes = bytes.buffer.asUint8List(); // ban đầu, dữ liệu và mảng byte -> sau câu lệnh này, thành mảng byte Uint8List
    await _audioPlayer.setAudioSource(AudioSource.uri( // đặt nguồn âm thanh cho audioPlayer
      Uri.parse('data:audio/mp3;base64,' + base64Encode(audioBytes)), // giải mã nguồn âm thanh && Tạo URI từ dữ liệu base64
    ));
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) { // cập nhật thời gian theo vị trí của slider
    _audioPlayer.seek(position);
  }

  void rePlay(){
    _replayCounter++;
    if (_replayCounter == 0){
      // don't replay
    }
    else if (_replayCounter == 1){
      _audioPlayer.seek(Duration.zero); // replay once 
    }
    else if (_replayCounter == 2){
      _audioPlayer.setLoopMode(LoopMode.one); // replay forever
      _replayCounter = 0;
    }
    print(  'replaycount: $_replayCounter');
  }

  void increment_replayCounter() {
    _replayCounter++;
  }

  // Phương thức để phát bài hát tiếp theo
  // Future<void> playNext(List<String> audioPaths, int currentIndex) async {
  //   var nextIndex = (currentIndex + 1) % audioPaths.length;
  //   if (nextIndex == audioPaths.length ) {
  //     nextIndex = 0;
  //   }
  //   await load(audioPaths[nextIndex]);
  // }
   // Phương thức để phát bài hát tiếp theo
  Future<void> playNext(List<String> audioPaths, int currentIndex) async {
    var nextIndex = (currentIndex + 1) % audioPaths.length;
    await load(audioPaths[nextIndex]);
  }

  // Phương thức để phát bài hát trước đó
  Future<void> playPrevious(List<String> audioPaths, int currentIndex) async {
    var previousIndex = currentIndex - 1;
    if (previousIndex < 0) {
      previousIndex = audioPaths.length - 1;
    }
    await load(audioPaths[previousIndex]);
  }

  

  void dispose() {
    // _isDisposed = true;
    if (!_positionSubject.isClosed) {
      _positionSubject.close();
    }
    if (!_playingSubject.isClosed) {
      _playingSubject.close();
    }
    _audioPlayer.dispose();
    
   

  }

}
