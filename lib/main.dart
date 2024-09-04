import 'package:currency_convertor/currency_converter_static.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: CurrencyConverterMaterialPage(),
    );
  }
}


