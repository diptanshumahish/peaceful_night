import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool isplaying = false;
String start = "Start";
String pause = "Pause";
bool isSlected = false;
var backColor1 = Colors.white.withOpacity(0.5);
var backColor2 = Colors.white.withOpacity(0.5);
var backColor3 = Colors.white.withOpacity(0.5);
var backColor4 = Colors.white.withOpacity(0.5);

class Meditate extends StatefulWidget {
  const Meditate({Key? key}) : super(key: key);

  @override
  State<Meditate> createState() => _MeditateState();
}

final player = AudioPlayer();

getSong() async {
  await player.setUrl(
      'https://drive.google.com/uc?export=view&id=1Ufl8hwZQVPljZyWztWfKRx0tBQstPwnM');
}

double comp = 0.0;

class _MeditateState extends State<Meditate> {
  void getTimer() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        var totalDur = player.duration?.inSeconds;
        comp = (player.position.inSeconds / ((totalDur ?? 0))).toDouble();
        if (comp == 1) {
          isplaying = false;
          player.stop();
          getSong();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getTimer();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String text1 = "Take deep breaths and think about something good :)";
    String text2 = "Gently sit/sleep in a relaxing position";
    String text3 = "Loosen your muscles , it's gonna be some good time";
    String text4 = "Take another minute and then close your eyes gently";
    String text5 = "We'll let you know when to get up";

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
          if (isplaying == false)
            Positioned(
                top: 180,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isSlected == false)
                      Text(
                        "Select your desired backgrond audio",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    if (isSlected == true)
                      Text(
                        "Currently playing :",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (() {
                            getSong();
                            setState(() {
                              isSlected = true;
                              backColor1 = Colors.white;
                              backColor2 = Colors.white.withOpacity(0.5);
                              backColor3 = Colors.white.withOpacity(0.5);
                              backColor4 = Colors.white.withOpacity(0.5);
                            });
                          }),
                          child: Container(
                            width: width / 2.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: backColor1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Rain",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            getSong();
                            setState(() {
                              isSlected = true;
                              backColor2 = Colors.white;
                              backColor1 = Colors.white.withOpacity(0.5);
                              backColor3 = Colors.white.withOpacity(0.5);
                              backColor4 = Colors.white.withOpacity(0.5);
                            });
                          }),
                          child: Container(
                            width: width / 2.4,
                            decoration: BoxDecoration(
                              color: backColor2,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ocean Waves",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (() {
                            getSong();
                            setState(() {
                              isSlected = true;
                              backColor3 = Colors.white;
                              backColor2 = Colors.white.withOpacity(0.5);
                              backColor1 = Colors.white.withOpacity(0.5);
                              backColor4 = Colors.white.withOpacity(0.5);
                            });
                          }),
                          child: Container(
                            width: width / 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: backColor3,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Piano",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            getSong();
                            setState(() {
                              isSlected = true;
                              backColor4 = Colors.white;
                              backColor2 = Colors.white.withOpacity(0.5);
                              backColor3 = Colors.white.withOpacity(0.5);
                              backColor1 = Colors.white.withOpacity(0.5);
                            });
                          }),
                          child: Container(
                            width: width / 2.4,
                            decoration: BoxDecoration(
                              color: backColor4,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "ThunderStorms",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
                          if (isSlected == false) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text("No Audio Selected"),
                                    content: Text(
                                        "Please select a background audio track"),
                                  );
                                });
                          } else if (isSlected == true) {
                            player.play();

                            setState(() {
                              isplaying = true;
                            });
                          }
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
                        _printDuration(player.position),
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      if (isplaying)
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurpleAccent.withOpacity(0.6)),
                            ),
                            onPressed: () async {
                              await player.stop();

                              setState(() {
                                isplaying = false;
                              });
                              getSong();
                            },
                            child: Text(
                              "Stop current session",
                              style: TextStyle(fontSize: 30),
                            )),
                      Spacer(),
                      if (comp > 0.0 && comp < 0.2)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '" $text1 "',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        ),
                      if (comp > 0.2 && comp < 0.3)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '" $text2"',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        ),
                      if (comp > 0.3 && comp < 0.4)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '" $text3"',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        ),
                      if (comp > 0.4 && comp < 0.5)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '" $text4"',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        ),
                      if (comp > 0.5 && comp < 1)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '" $text5"',
                            style: TextStyle(color: Colors.white, fontSize: 29),
                          ),
                        )
                    ],
                  ))),
        ],
      ),
    );
  }
}

String _printDuration(Duration? duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitsMinutes = twoDigits(duration!.inMinutes.remainder(60));
  String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitsMinutes:$twoDigitsSeconds";
}
