import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: bmi_cal_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class BMICalculatorPage extends StatelessWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(),
              const SizedBox(height: 16),
              TextFormField(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onPressed,
                child: const Text('계산하기'),
              ),
            ],
          ),
        ),
      );

  void _onPressed() {}
}
