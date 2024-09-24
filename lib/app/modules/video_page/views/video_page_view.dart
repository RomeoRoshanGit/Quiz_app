import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_page_controller.dart';

class VideoPageView extends GetView<VideoPageController> {
  final VideoPageController videoController = Get.put(VideoPageController());
  VideoPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            if (!videoController.isInitialized.value) {
              return const CupertinoActivityIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: videoController.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoController.videoPlayerController),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }
          }),
        ),
      ),
      floatingActionButton: Obx(()=>FloatingActionButton(
        onPressed: videoController.togglePlayPause,
        child: Icon(
          videoController.isPlaying.value ? Icons.pause : Icons.play_arrow,
        ),
      ),)
    );

  }
}
