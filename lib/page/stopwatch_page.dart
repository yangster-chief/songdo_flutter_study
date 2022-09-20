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

  final List<int> _record = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(_duration ~/ (60 * 60 * 100) % 60).toString().padLeft(2, '0')} : ${(_duration ~/ (60 * 100) % 60).toString().padLeft(2, '0')} : ${(_duration ~/ 100 % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 48),
                  ),
                  Text(
                    '${_duration % 100}',
                    style: const TextStyle(fontSize: 32),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 216,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _record.length,
                itemBuilder: (context, index) => _RecordItem(
                  index: index,
                  duration: _record[index],
                  diff: index == 0
                      ? _record[0]
                      : _record[index] - _record[index - 1],
                ),
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
                    _onRecord(_duration);
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
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _duration = 0;
      _record.clear();
    });
  }

  void _onRecord(int duration) {
    _record.add(duration);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class _RecordItem extends StatelessWidget {
  const _RecordItem(
      {Key? key,
      required this.index,
      required this.duration,
      required this.diff})
      : super(key: key);

  final int index;
  final int duration;
  final int diff;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('랩 ${index + 1}'),
            const SizedBox(width: 16),
            Text(
                '${(duration ~/ (60 * 60 * 100) % 60).toString().padLeft(2, '0')} : ${(duration ~/ (60 * 100) % 60).toString().padLeft(2, '0')} : ${(duration ~/ 100 % 60).toString().padLeft(2, '0')} . ${(duration % 100).toString().padLeft(2, '0')}'),
            const SizedBox(width: 16),
            Text(
                '${(diff ~/ (60 * 60 * 100) % 60).toString().padLeft(2, '0')} : ${(diff ~/ (60 * 100) % 60).toString().padLeft(2, '0')} : ${(diff ~/ 100 % 60).toString().padLeft(2, '0')} . ${(diff % 100).toString().padLeft(2, '0')}'),
          ],
        ),
      );
}
