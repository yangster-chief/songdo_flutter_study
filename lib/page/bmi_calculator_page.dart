import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: bmi_cal_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  int _height = 0;
  int _weight = 0;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: '키 입력'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
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
              const SizedBox(height: 32),
              Text('키 : $_height'),
              const SizedBox(height: 16),
              Text('몸무게 : $_weight'),
            ],
          ),
        ),
      );

  void _onPressed() {
    setState(() {
      _height = int.tryParse(_heightController.text) ?? 0;
      _weight = int.tryParse(_weightController.text) ?? 0;
    });
  }
}
