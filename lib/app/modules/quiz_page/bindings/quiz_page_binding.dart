import 'package:get/get.dart';

import '../controllers/quiz_page_controller.dart';

class QuizPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizPageController>(
      () => QuizPageController(),
    );
  }
}
