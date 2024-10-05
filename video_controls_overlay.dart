import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onToggleFullScreen;

  const VideoControlsOverlay({
    Key? key,
    required this.controller,
    required this.onToggleFullScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            padding: EdgeInsets.all(16.0),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: onToggleFullScreen,
            icon: Icon(Icons.fullscreen),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
