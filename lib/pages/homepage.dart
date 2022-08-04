import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime())
        .cancel();
    super.dispose();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('jm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(children: [
        SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl:
                'https://drive.google.com/uc?export=view&id=1cGynrBMcOtluDjo0k36IisvP_FvS8wLV',
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
            top: 100,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome friend",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                Text(
                  "Hope you are doing great!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
              ],
            )),
        Positioned(
            top: height / 3,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quick Links",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(0.1)),
                  width: width - 20,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Meditate",
                          style: TextStyle(
                            color: Colors.blue.shade200,
                            fontSize: 40,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.forward,
                          color: Colors.blue.shade200,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(0.1)),
                  width: width - 20,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          "Sleep",
                          style: TextStyle(
                            color: Colors.pinkAccent.shade100,
                            fontSize: 40,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          CupertinoIcons.forward,
                          color: Colors.pinkAccent.shade100,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  _timeString,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 100,
            left: 20,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quote of the day :',
                  style: TextStyle(
                    color: Colors.lightBlue.shade100,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '"This text is just for testing how large we can make the text over here , I think its working quite fine till now okay "',
                  style: TextStyle(
                    color: Colors.white.withAlpha(200),
                    fontSize: 30,
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
