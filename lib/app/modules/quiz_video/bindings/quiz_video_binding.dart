import 'package:get/get.dart';

import '../controllers/quiz_video_controller.dart';

class QuizVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizVideoController>(
      () => QuizVideoController(),
    );
  }
}
