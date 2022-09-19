import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: bmi_cal_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class BMICalculatorPage extends StatelessWidget {
  BMICalculatorPage({Key? key}) : super(key: key);

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: '키 입력'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: '몸무게 입력'),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text('계산하기'),
                ),
              ),
            ],
          ),
        ),
      );

  void _onPressed() {
    print('키: ${heightController.text}');
    print('몸무게: ${weightController.text}');
  }
}
