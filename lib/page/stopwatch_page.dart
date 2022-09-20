import 'dart:async';

import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: stopwatch_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Timer? _timer;
  int _duration = 0;
  bool _isRunning = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_duration',
                    style: const TextStyle(fontSize: 48),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    _onReset();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.autorenew),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _onPressed();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: _isRunning
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _onRecord();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      );

  void _onPressed() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _duration++;
        });
      });
    } else {
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _onReset() {
    print('reset');
  }

  void _onRecord() {
    print('record');
  }
}
