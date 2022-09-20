import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: bmi_calculate_result_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class BMICalculateResultPage extends StatelessWidget {
  const BMICalculateResultPage({Key? key, required this.bmi}) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('BMI Result'),
        ),
        body: Center(
          child: _resultWidget(bmi),
        ),
      );
  Widget _resultWidget(double bmi) {
    String result = '';
    Icon icon = const Icon(
      Icons.sentiment_very_dissatisfied,
      size: 108,
      color: Colors.red,
    );
    if (bmi < 0.9) {
      result = '저체중';
      icon = const Icon(
        Icons.sentiment_neutral_outlined,
        size: 108,
        color: Colors.blue,
      );
    } else if (bmi < 1.1) {
      result = '정상';
      icon = const Icon(
        Icons.sentiment_very_satisfied,
        size: 108,
        color: Colors.green,
      );
    } else if (bmi < 1.2) {
      result = '과체중';
      icon = const Icon(
        Icons.sentiment_neutral_outlined,
        size: 108,
        color: Colors.yellow,
      );
    } else if (bmi < 1.3) {
      result = '경도 비만';
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        size: 108,
        color: Colors.red,
      );
    } else if (bmi < 1.6) {
      result = '경도 비만';
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        size: 108,
        color: Colors.red,
      );
    } else {
      result = '고도 비만';
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        size: 108,
        color: Colors.red,
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '체질량지수(BMI)는 ${(bmi * 100).toStringAsFixed(1)}로\n$result 입니다.',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        icon,
      ],
    );
  }
}
