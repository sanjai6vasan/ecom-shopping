import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumb extends StatefulWidget {
  final String userId;
  const VideoThumb({Key key, this.userId}) : super(key: key);
  @override
  _VideoThumbState createState() => _VideoThumbState();
}

class _VideoThumbState extends State<VideoThumb> {
  VideoPlayerController videoPlayerController;
  ChewieController _chewieController;
  Uint8List imageBytes;
  @override
  void initState() {
    _generateThumbnail();
    initializePlayer();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  _generateThumbnail() async {
    String fileName = await VideoThumbnail.thumbnailFile(
      video: widget.userId,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight:
          250, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    final file = File(fileName);
    imageBytes = file.readAsBytesSync();
    print('----image--->>>$fileName');
    setState(() {});
  }

  Future<void> initializePlayer() async {
    if (mounted) {
      videoPlayerController = VideoPlayerController.network(widget.userId);
      await videoPlayerController.initialize();
      _createChewieController();
      setState(() {});
    }
  }

  _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: videoPlayerController.value.aspectRatio,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      autoPlay: false,
      looping: true,
      allowFullScreen: true,
      allowedScreenSleep: false,
      autoInitialize: true,
      fullScreenByDefault: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        padding: const EdgeInsets.all(12.0),
        color: Colors.lightBlue[50],
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _chewieController != null &&
                        _chewieController
                            .videoPlayerController.value.isInitialized &&
                        _chewieController.isPlaying &&
                        _chewieController.isFullScreen
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : Stack(
                        children: [
                          imageBytes != null
                              ?
                              // Thumbnail image loading
                              Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.memory(
                                    imageBytes,
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                )
                              // IF Thumbnail image loading is not loading
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                          _chewieController != null
                              ? // Play button overlay in Thumbnail image
                              Align(
                                  alignment: Alignment.center,
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.white, // Button color
                                      child: InkWell(
                                        splashColor:
                                            Colors.white, // Splash color
                                        onTap: () {
                                          _chewieController.play();
                                          _chewieController.enterFullScreen();
                                          setState(() {
                                          });
                                        },
                                        child: SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Icon(Icons.play_arrow)),
                                      ),
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator())
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
