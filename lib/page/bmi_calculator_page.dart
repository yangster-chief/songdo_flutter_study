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
            children: [
              Text('키'),
              Text('몸무게'),
              Text('제출'),
            ],
          ),
        ),
      );
}
