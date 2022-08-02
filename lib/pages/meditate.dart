import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lottie/lottie.dart';

bool isplaying = false;
String start = "Start";
String pause = "Pause";

class Meditate extends StatefulWidget {
  const Meditate({Key? key}) : super(key: key);

  @override
  State<Meditate> createState() => _MeditateState();
}

class _MeditateState extends State<Meditate> {
  @override
  void initState() {
    DefaultCacheManager().emptyCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl:
                  'https://drive.google.com/uc?export=view&id=1OYjkMtQfqSnNC2XjxMo2qm-4dHLVacV8',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black])),
          ),
          Positioned(
              top: 80,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meditation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "Get relaxed for a while :)",
                    style: TextStyle(
                      color: Colors.white.withAlpha(200),
                      fontSize: 30,
                    ),
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (() {
                        setState(() {
                          isplaying = !isplaying;
                        });
                      }),
                      child: !isplaying
                          ? Icon(
                              Icons.play_circle_filled_rounded,
                              size: 80,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.pause_circle_filled_rounded,
                              size: 80,
                              color: Colors.white,
                            )),
                  SizedBox(
                    height: 10,
                  ),
                  !isplaying
                      ? Text(
                          start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        )
                      : Text(
                          pause,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isplaying)
                        LottieBuilder.asset(
                          'assets/lottie/playing.json',
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      Text(
                        isplaying ? "Red Medley - Whispers" : " ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: height / 10,
              left: 0,
              right: 0,
              child: Container(
                  height: height / 5,
                  color: Colors.deepPurple,
                  child: Column()))
        ],
      ),
    );
  }
}
