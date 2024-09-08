import 'package:currency_convertor/services/api_client.dart';
import 'package:currency_convertor/widgets/drop_down.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiClient client= ApiClient();
final TextEditingController textEditingController =TextEditingController();
  // setting colors for app
  Color mainColor = const Color(0xff212936);
  Color secondryColor = const Color(0xff2849e5);
  // setting variables
  late List<String> currencies;
  String from = 'USD';
  String to = 'USD';
  // variables for conversion
  late double rate;
  String result='';

  Future<List<String>> getCurrencyList() async{
    return await client.getCurrencies();
  }
  @override
  void initState() {
    super.initState();
    (() async{
        List<String> list = await client.getCurrencies();
        setState(() {
          currencies = list;
        });
    })();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: mainColor,
      body:SafeArea(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(bottom:80.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Result",
                              style: TextStyle(
                                color:Colors.black, 
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              result,
                              style: TextStyle(
                                color: secondryColor,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        onSubmitted: (value) async {
                          rate = await client.getRate(from,to);
                          setState(() {
                            result = (rate * double.parse(value)).toStringAsFixed(3);
                          });
                        },
                        controller: textEditingController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Amount....",
                          hintStyle: const TextStyle(
                            color: Colors.black54
                          ),
                          prefixIconColor: Colors.black,
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: Colors.yellowAccent,
                              ),
                              borderRadius: BorderRadius.circular(10),
                          ),
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customDropDown(currencies, from, (val){
                            setState(() {
                              from=val;
                            });
                          }),
                          FloatingActionButton(
                            onPressed: (){
                              String temp = to;
                              setState(() {
                                to = from;
                                from = temp;
                              });
                            },
                            elevation: 0.0,
                            backgroundColor: Colors.yellow,
                            child: const Icon(Icons.swap_horiz),
                          ),
                          customDropDown(currencies, to, (val){
                            setState(() {
                              to=val;
                            });
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        child: ElevatedButton(
                          onPressed: ()async{
                              rate = await client.getRate(from,to);
                              setState(() {
                                result = (rate * double.parse(textEditingController.text)).toStringAsFixed(3);
                              });
                          },
                          style:ElevatedButton.styleFrom(
                             backgroundColor: Colors.yellow,
                            foregroundColor:  Colors.black,
                            maximumSize: const Size(250, 50),
                            minimumSize: const Size(250, 50),
                            shape: 
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                        
                          ),
                          child:
                          const Text('Convert'),
                          ),
                      ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                          child: ElevatedButton(
                          onPressed: (){
                              setState(() {
                                result = "";
                                textEditingController.text="";

                              });
                          },
                          style:ElevatedButton.styleFrom(
                             backgroundColor: Colors.yellow,
                            foregroundColor:  Colors.black,
                            minimumSize: const Size(250, 50),
                            maximumSize: const Size(250, 50),
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
                  ),
                ),
              ),
            ], 
          ),
        ),
      ),
    );
  }
}
