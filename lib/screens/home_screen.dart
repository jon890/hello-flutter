import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const TWENTY_FIVE_MINUTUES = 1500;

  int totalSeconds = TWENTY_FIVE_MINUTUES;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var string = duration.toString().split(".").first.substring(2);
    return string;
  }

  void onTick(Timer timer) {
    if (totalSeconds <= 0) {
      setState(() {
        totalPomodoros++;
        totalSeconds = TWENTY_FIVE_MINUTUES;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    format(totalSeconds),
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ))),
          Flexible(
              flex: 2,
              child: Center(
                  child: IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outlined)))),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Pomodoros",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .color)),
                            Text("$totalPomodoros",
                                style: TextStyle(
                                    fontSize: 58,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .color))
                          ],
                        )),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
