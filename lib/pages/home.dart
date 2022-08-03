import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:peaceful_night/pages/homepage.dart';
import 'package:peaceful_night/pages/meditate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              controller: controller,
              physics: BouncingScrollPhysics(),
              children: [HomePageScreen(), Meditate()],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.home, color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.circle,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.profile_circled,
                              color: Colors.white))
                    ],
                  ),
                ))
          ],
        ));
  }
}
