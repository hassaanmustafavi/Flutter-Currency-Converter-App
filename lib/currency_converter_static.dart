import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverter_Static extends StatefulWidget{
   const CurrencyConverter_Static({super.key});

  @override
  State<CurrencyConverter_Static> createState() =>
   _CurrencyConverter_StaticState();

}


class _CurrencyConverter_StaticState extends
 State<CurrencyConverter_Static> {
   
  double result=0.0;
  final TextEditingController textEditingController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final  border =  OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        color: Colors.yellowAccent,
        ),
        borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
        body:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Rs '+ result.toString() + '/-', 
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onSubmitted: (value) => setState(() {
                      result = double.parse(textEditingController.text)*275;
                    }),
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ], // Allow numbers and a single decimal point
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Amount in USD",
                  hintStyle: const TextStyle(
                    color: Colors.black54
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2.0,
                    style: BorderStyle.solid,
                    color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ), 
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                    setState(() {
                      result = double.parse(textEditingController.text)*275;
                    });
                },
                style:ElevatedButton.styleFrom(
                   backgroundColor: Colors.yellow,
                  foregroundColor:  Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: 
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                   
                ),
                child:
                const Text('Convert'),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                    setState(() {
                      result = 0.0;
                      textEditingController.text='';
                    });
                },
                style:ElevatedButton.styleFrom(
                   backgroundColor: Colors.yellow,
                  foregroundColor:  Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: 
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                   
                ),
                child:
                const Text('Clear'),
                ),
            ),
          ],
                  )
        ) 
      );
  }
}

