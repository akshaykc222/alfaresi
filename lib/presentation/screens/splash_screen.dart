import 'package:alfaresi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@override
SplashScreenState createState() => SplashScreenState();

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
        "assets/images/png/splash_video.mp4",
      )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.setLooping(true);

    Future.delayed(const Duration(seconds: 2), _goToNext);
  }

  void _goToNext() {
    GRouteOnboard().goNamed(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child:
            _controller.value.isInitialized
                ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                : const CircularProgressIndicator(), // Show a loader until video loads
      ),
    );
  }
}
