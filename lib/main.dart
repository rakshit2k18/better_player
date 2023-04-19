import 'package:betterplayer/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: VideoScreen(videoUrl: 'https://spidernet.b-cdn.net/6435600bc7f90/playlist.m3u8'),
    );
  }
}
