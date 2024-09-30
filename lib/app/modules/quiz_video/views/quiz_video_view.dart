import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_app/app/modules/utils/color_res.dart';
import 'package:quiz_app/app/modules/utils/styles.dart';
import 'package:video_player/video_player.dart';

import '../controllers/quiz_video_controller.dart';

class QuizVideoView extends GetView<QuizVideoController> {
  final QuizVideoController videoController = Get.put(QuizVideoController());

  QuizVideoView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.bgColor,
          body: SingleChildScrollView(
            child: Center(
              child: Obx(() {
                if (!videoController.isInitialized.value) {
                  return Center(child: const CupertinoActivityIndicator());
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 200,
                          width: 350,
                          child: AspectRatio(
                            aspectRatio: videoController.videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(videoController.videoPlayerController),
                          ),
                        ),
                      ),
                      const SizedBox(height: 150),
                      Text("Hang on..",style: textSemiBold(color: ColorRes.textColor,size: 18),),
                      const SizedBox(height: 20),
                      Text("Your quiz is right on the way!!",style: textRegular(color: ColorRes.secondary),)
                    ],
                  );
                }
              }),
            ),
          ),
          // floatingActionButton: Obx(()=>FloatingActionButton(
          //   onPressed: videoController.togglePlayPause,
          //   child: Icon(
          //     videoController.isPlaying.value ? Icons.pause : Icons.play_arrow,
          //   ),
          // ),)
      ),
    );

  }
}
