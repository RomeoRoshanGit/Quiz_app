import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPageController extends GetxController {
  //TODO: Implement VideoPageController

  late VideoPlayerController videoPlayerController;
  var isPlaying = false.obs;
  var isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVideo();
  }


  void initializeVideo() async {
    videoPlayerController = VideoPlayerController.asset(
      'assets/videos/detail.mp4',
    );

    await videoPlayerController.initialize();
    isInitialized.value = true;
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(100);
    update();
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
    update();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
