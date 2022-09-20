import 'package:flutter/material.dart';
import 'package:flutter_study/page/bmi_calculate_result_page.dart';

///
/// flutter_study
/// File Name: bmi_cal_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///

enum Gender { male, female }

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({Key? key}) : super(key: key);

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  Gender _gender = Gender.male;

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
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('남'),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value ?? Gender.male;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('여'),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value ?? Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
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
    final bmi = _calculateBMI(
      height: int.tryParse(_heightController.text) ?? 0,
      weight: int.tryParse(_weightController.text) ?? 0,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BMICalculateResultPage(
          bmi: bmi,
        ),
      ),
    );
  }

  double _calculateBMI({required int height, required int weight}) {
    final c = _gender == Gender.male ? 22 : 21;
    return weight / ((height / 100) * (height / 100) * c);
  }
}
