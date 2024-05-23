import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app_test_getx/controllers/audio_player_controller.dart';
import 'package:music_app_test_getx/const/color.dart';
import 'package:music_app_test_getx/model/song_model.dart';

class SongDetail extends StatefulWidget {
  final SongModel song;

  const SongDetail({Key? key, required this.song}) : super(key: key);

  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  late final AudioPlayerController _audioPlayerController;

  //late AudioPlayerController _audioPlayerController = Get.find<AudioPlayerController>();

  @override
  void initState() {
    super.initState();
    _audioPlayerController = Get.find<
        AudioPlayerController>(); // khởi tạo đối tượng AudioPlayerController

    // if (_audioPlayerController.getIsDisposed == false){
    //   _audioPlayerController.dispose();
    // }
    _audioPlayerController.load(widget.song.url); // load dữ liệu âm thanh
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.song.genre),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_rounded, size: 30))
        ],
      ),
      body:
          // playing song detail
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          /************************
             * Display Image
            *************************/
          Container(
            width: size.width,
            height: size.width * 0.7,
            child: Center(
              child: ClipOval(
                  child: Stack(
                children: [
                  Image.asset(
                    'assets/images/login_image.jpg',
                    width: size.width * 0.7,
                    height: size.width * 0.7,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.width * 0.7,
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              )),
            ),
          ),
          const SizedBox(height: 40),

          /************************
             * Display a song's name
            *************************/
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 00),
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              widget.song.title,
              style: const TextStyle(
                  fontSize: 20,
                  color: ColorText.color_text,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /************************
             *  artist's name
            *************************/
          Text(
            widget.song.artist,
            style: const TextStyle(
              fontSize: 16,
              color: ColorText.color_hintText,
            ),
            overflow: TextOverflow.ellipsis,
          ),

          /************************
             * slider
            *************************/

          StreamBuilder<Duration?>(
            stream: _audioPlayerController
                .positionStream, // lắng nghe sự kiện thay đổi vị trí
            builder: (context, snapshot) {
              final position =
                  snapshot.data ?? Duration.zero; // lấy vị trí hiện tại
              return StreamBuilder<Duration?>(
                stream: _audioPlayerController.audioPlayer.durationStream,
                builder: (context, durationSnapshot) {
                  final duration = durationSnapshot.data ?? Duration.zero;
                  return Slider(
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      _audioPlayerController
                          .seek(Duration(seconds: value.toInt()));
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(height: 20),

          /************************
             * button: play, pause, next, previous
            *************************/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.repeat, size: 30)),
              IconButton(
                icon: const Icon(Icons.skip_previous, size: 60),
                onPressed: () {},
              ),
              StreamBuilder<bool>(
                stream: _audioPlayerController
                    .playingStream, // lắng nghe sự kiện thay đổi trạng thái phát
                builder: (context, snapshot) {
                  final playing = snapshot.data ??
                      false; // lấy trạng thái phát nhạc từ stream
                  return IconButton(
                    onPressed: () {
                      if (playing) {
                        _audioPlayerController.pause(); //tạm dừng nếu đang phát
                      } else {
                        _audioPlayerController.play(); // phát nếu đang tạm dừng
                      }
                    },
                    icon: playing
                        ? const Icon(Icons.pause, size: 70)
                        : const Icon(Icons.play_arrow, size: 70),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, size: 60),
                onPressed: () {},
              ),
              IconButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));

                  _audioPlayerController.rePlay();
                },
                icon: Icon(correspondingToIcon( // bug thay đổi icon khi click 
                    _audioPlayerController.get_replayCounter)),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.alarm_rounded, size: 30)),
              const SizedBox(width: 50),
              ElevatedButton.icon(
                  icon: const Icon(Icons.list_outlined),
                  onPressed: () {},
                  label: const Text('Danh sách phát'))
            ],
          )
        ],
      ),
    );
  }

  // Hàm trả về icon tương ứng với số lần click
  IconData? correspondingToIcon(int replayCounter) {
    switch (replayCounter) {
      case 0:
        // Icon when not replaying
        return Icons.replay;
      case 1:
        // Icon when replaying once
        return Icons.replay_10;
      case 2:
        // Icon when replaying forever
        return Icons.replay_circle_filled_outlined;
      default:
        return Icons.replay;
    }
  }
/*
  // Hàm để phát bài hát tiếp theo
  void _playNext() {
    _currentSongIndex = (_currentSongIndex + 1) % audioPaths.length;
    _audioPlayerController.load(audioPaths[_currentSongIndex]);
  }

  // Hàm để phát bài hát trước đó
  void _playPrevious() {
    _currentSongIndex = (_currentSongIndex - 1) % audioPaths.length;
    if (_currentSongIndex < 0) {
      _currentSongIndex = audioPaths.length - 1;
    }
    _audioPlayerController.load(audioPaths[_currentSongIndex]);
  }
*/
}
