 import 'package:dynamic_grade_calculator_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({ required this.ortalama, required this.dersSayisi, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Girilmedi !' ,
          style: Constants.ortalamaGosterBodyStyle,
        ),
        // ignore: unnecessary_string_interpolations
        Text(ortalama >=0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
        style: Constants.ortalamaStyle,),
        Text('Ortalama',style: Constants.ortalamaGosterBodyStyle,)
      ],
    );
  }
}