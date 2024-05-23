import 'package:get/get.dart';
import 'package:music_app_test_getx/controllers/audio_player_controller.dart';

class AudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioPlayerController>(() => AudioPlayerController());
  }
}