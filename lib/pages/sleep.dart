import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

bool isplaying = false;
String start = "Start";
String pause = "Pause";
bool isSlected = false;
var backColor1 = Colors.white.withOpacity(0.5);
var backColor2 = Colors.white.withOpacity(0.5);
var backColor3 = Colors.white.withOpacity(0.5);
var backColor4 = Colors.white.withOpacity(0.5);

class Sleeppage extends StatefulWidget {
  const Sleeppage({Key? key}) : super(key: key);

  @override
  State<Sleeppage> createState() => _SleeppageState();
}

class _SleeppageState extends State<Sleeppage> {
  final player = AudioPlayer();
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
                  'https://drive.google.com/uc?export=view&id=1s5sF679BD6t199CYwVTYFe1HRfl1lVnU',
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
                    colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black
                ])),
          ),
          Positioned(
              top: 80,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sleep",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "A peaceful sleep :)",
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
                      const Text(
                        "Select your desired backgrond audio",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    if (isSlected == true)
                      const Text(
                        "Currently playing :",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (() {
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
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (() {
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
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
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
                bottom: height / 30,
                child: LottieBuilder.asset(
                    height: 400, 'assets/lottie/sleep.json')),
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
                                  return const CupertinoAlertDialog(
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
                        child: const Icon(
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
                        child: const Icon(
                          Icons.pause_circle_filled_rounded,
                          size: 80,
                          color: Colors.white,
                        )),
                  const SizedBox(
                    height: 10,
                  ),
                  !isplaying
                      ? Text(
                          start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        )
                      : Text(
                          pause,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
