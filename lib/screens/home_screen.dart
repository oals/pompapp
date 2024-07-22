import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = true;
  late Timer timer;
  int totalPomodoros = 0;

  void onTick(Timer timer){
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = true;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onResetPressed() {
    setState(() {
      isRunning = true;
      totalSeconds = twentyFiveMinutes;
    });
    timer.cancel();
  }

  void onStartPressed() {
    timer = Timer.periodic(Duration(seconds: 1), onTick);

    setState(() {
      isRunning = false;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = true;
    });
  }

  String format(int seconds){
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2,7);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7626C),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(format(totalSeconds),style: TextStyle(
                color: Color(0XFFF4EDDB),
                fontSize: 89,
                fontWeight: FontWeight.w600
              ),),

            ),),
          Flexible(
            flex: 2,
            child: Container(
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      iconSize: 120,
                      color: Color(0XFFF4EDDB),
                      icon : Icon(isRunning ? Icons.play_circle_outline : Icons.pause_circle_outline),
                      onPressed: isRunning ? onStartPressed : onPausePressed,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      iconSize: 60,
                      color: Color(0XFFF4EDDB),
                      icon : Icon(Icons.restart_alt),
                      onPressed: onResetPressed,
                    ),
                  ),
                ],
              ),
            ),),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFF4EDDB),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pomodoros',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.headlineMedium!.color,
                          fontWeight: FontWeight.w600

                        ),),
                        Text('$totalPomodoros',
                          style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context).textTheme.headlineMedium!.color,
                              fontWeight: FontWeight.w600

                          ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),),
        ],
      ),
    );
  }
}
