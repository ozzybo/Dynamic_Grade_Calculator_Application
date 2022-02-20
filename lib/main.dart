import 'package:dynamic_grade_calculator_app/constants/app_constants.dart';
import 'package:dynamic_grade_calculator_app/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Ortalama Hesaplama',
      theme: ThemeData(
          primarySwatch: Constants.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const OrtalamaHesaplaPage(),
    );
  }
}
