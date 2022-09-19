import 'package:flutter/material.dart';

///
/// flutter_study
/// File Name: bmi_calculate_result_page
/// Created by sujangmac on 2022/09/19
///
/// Description:
///
class BMICalculateResultPage extends StatelessWidget {
  const BMICalculateResultPage(
      {Key? key, required this.height, required this.weight})
      : super(key: key);

  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('BMI Result'),
        ),
        body: Center(
          child: Text('키 : $height, 몸무게 : $weight'),
        ),
      );
}
