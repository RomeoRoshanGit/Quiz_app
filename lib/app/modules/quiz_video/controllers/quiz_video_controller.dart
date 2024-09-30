import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:video_player/video_player.dart';

class QuizVideoController extends GetxController {
  //TODO: Implement QuizVideoController
  late VideoPlayerController videoPlayerController;
  var isPlaying = false.obs;
  var isInitialized = false.obs;
  String subject='';
  String admno='';
  String videoUrl='';

  @override
  void onInit() {
    super.onInit();
    List data=Get.arguments as List;
    subject=data[0];
    admno=data[1];
    setVideo();
  }

  setVideo(){
    if(subject=='Networks'||subject=='Data Structures'||subject=='DBMS'){
      videoUrl='assets/videos/mca.mp4';
    }
    else if(subject=='Quantum'||subject=='Electromagnetism'||subject=='Mechanics'){
      videoUrl='assets/videos/physics.mp4';
    }
    else{
      videoUrl='assets/videos/maths.mp4';
    }
    initializeVideo();

  }

  void nextPage(){
    Get.offAllNamed(Routes.QUIZ_PAGE,arguments: [subject,admno]);
  }


  void initializeVideo() async {
    videoPlayerController = VideoPlayerController.asset(
      videoUrl,
    );

    await videoPlayerController.initialize();
    isInitialized.value = true;
    videoPlayerController.setLooping(false);
    videoPlayerController.setVolume(100);
    videoPlayerController.play();
    isPlaying.value=true;
    Future.delayed(const Duration(seconds: 3), () {
      nextPage();
    });
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
