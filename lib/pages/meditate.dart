import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool isplaying = false;
String start = "Start";
String pause = "Pause";

class Meditate extends StatefulWidget {
  const Meditate({Key? key}) : super(key: key);

  @override
  State<Meditate> createState() => _MeditateState();
}

final player = AudioPlayer();

getSong() async {
  final duration = await player.setUrl(
      'https://drive.google.com/uc?export=view&id=1Ufl8hwZQVPljZyWztWfKRx0tBQstPwnM');
}

double comp = 0.0;

class _MeditateState extends State<Meditate> {
  void getTimer() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        var totalDur = player.duration?.inSeconds;
        comp = (player.position.inSeconds / ((totalDur ?? 0))).toDouble();
      });
    });
  }

  @override
  void initState() {
    getSong();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTimer();
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
          if (isplaying)
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: CircularPercentIndicator(
                  progressColor: Colors.pink.withOpacity(0.7),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  percent: comp,
                  animation: false,
                  animateFromLastPercent: false,
                  radius: 150,
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
                  if (!isplaying)
                    InkWell(
                        onTap: () {
                          player.play();

                          setState(() {
                            isplaying = true;
                          });
                        },
                        child: Icon(
                          Icons.play_circle_filled_rounded,
                          size: 80,
                          color: Colors.white,
                        )),
                  if (isplaying)
                    InkWell(
                        onTap: (() {
                          player.pause();

                          setState(() {
                            player.pause();
                            isplaying = false;
                          });
                        }),
                        child: Icon(
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
                        isplaying ? "Jacob Piano -Interstellar" : " ",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        player.position.toString(),
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
