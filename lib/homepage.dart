import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/homepage.mp4');

  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 1 / 1,
        autoPlay: true,
        autoInitialize: true,
        looping: true,
        showControls: false,
        showControlsOnInitialize: false);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "VERIFIED",
            style:
                TextStyle(letterSpacing: 7, fontSize: 36, color: Colors.grey),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Chewie(controller: chewieController!))),
              SizedBox(
                height: 10,
              ),
              Text(
                "You are logged in !!",
                style: TextStyle(
                    color: Colors.purple, fontSize: 14, wordSpacing: 5),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'phone');
                  },
                  child: Text(
                    "<",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 50,
                    ),
                  ))
            ],
          ),
        ));
  }
}
