import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/services.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

  VideoScreen({required this.videoUrl});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    super.initState();
    _setupVideoPlayer();
  }

  void _setupVideoPlayer() {
    _betterPlayerController = BetterPlayerController(
         BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          autoPlay: true,
          looping: true,
          autoDetectFullscreenAspectRatio: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
              enablePlaybackSpeed: true,
              enableProgressBarDrag: true,
              showControls: true,
              enableSkips: true,
              enableOverflowMenu: true,
            
              enableFullscreen: true),
  deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
              


        ),
        betterPlayerDataSource: BetterPlayerDataSource(
            BetterPlayerDataSourceType.network, widget.videoUrl));
  }

  @override
  void dispose() {
    _betterPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Screen')),
      body: Container(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: _betterPlayerController!),
        ),
      ),
    );
  }
}
