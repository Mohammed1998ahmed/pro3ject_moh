import 'package:flutter/material.dart';
import 'package:thi/component/conset/Const.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.Urlvideo});
  final String Urlvideo;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(ImagesPath.toString() + widget.Urlvideo.toString()))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    print(ImagesPath.toString() + widget.Urlvideo.toString() + "");

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          ),
      body: Center(
        child: _controller.value.isInitialized
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.only(top: 0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(
                    _controller,
                  ),
                ),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color0,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
