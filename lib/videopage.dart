import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final vidController;
  VideoPlayerWidget({this.vidController});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _vidController;
  late ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _vidController.dispose();

    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _vidController = widget.vidController;
    // Controller is passed from the main page list tiles

    await Future.wait([
      _vidController.initialize(),
    ]);

    // Makes sure the video is ready to be played

    _chewieController = ChewieController(
      videoPlayerController: _vidController,
      autoPlay: true,
      fullScreenByDefault: true,
      allowFullScreen: true,
      aspectRatio: 16 / 9, // width and height of the video
      looping: false, // Defines whether to play the video after ending or not
      errorBuilder: (context, errorMessage) {
        return Text("Oops, looks like something went wrong");
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, "/home"); // Back button the home page
          },
        ),
        title: Text("Hiit School"),
        backgroundColor: Color(0xff27BD93),
        centerTitle: true,
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
      ),
    );
  }
}
