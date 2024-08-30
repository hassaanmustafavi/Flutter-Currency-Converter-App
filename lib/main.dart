import 'package:currency_convertor/currency_converter_material_app.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: CurrencyConverterMaterialPage(),
    );
    
  }

}