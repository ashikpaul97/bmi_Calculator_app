import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  // var bgColor = Colors.purple[50];
  // var errorMessage = 'Please fill all the required blanks !! ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Constants.navColor,
        ),
      ),
      backgroundColor: Constants.bgColor,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Constants.navColor,
                ),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 20,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'BMI',
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ))),
              ),
              SizedBox(height: 35),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                    hintText: "Enter your weight(In Kg)",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2,),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2,),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2,),
                    ),
                    //label: Text('Enter your weight in kg',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,),
                    prefixIcon: Container(
                      height: 5,
                      width: 5,
                      child: Image.asset('assets/images/no.png'),
                    )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  hintText: "Enter your height(In Feet)",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2,),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2,),
                  ),
                  prefixIcon: Container(
                      height: 5,
                      width: 5,
                      child: Image.asset('assets/images/yes.png')),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  // labelText: 'Height(In Inch)',
                  hintText: "Enter your height(In Inch)",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2,),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, ),
                  ),
                  prefixIcon: Container(
                      height: 5,
                      width: 5,
                      child: Image.asset('assets/images/yes.png')),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Constants.navColor,
                    onPrimary: Colors.black.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != '' && ft != '' && inch != '') {
                      //BMI calculate
                      var iwt = double.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);

                      var tinch = (ift * 12) + iinch;
                      var tCm = tinch * 2.54;
                      var tM = tCm / 100;

                      var bmi = iwt / (tM * tM);
                      var msg = "";

                      //Burn weight
                      var minimumbmi = 24.9 * (tM * tM);
                      var burnWeight = iwt - minimumbmi;

                      //Gain weight
                      var minBmi = 19 * (tM * tM);
                      var gainWeight = minBmi - iwt;

                      if (bmi > 24.9) {
                        msg = "You are OverWeight !!\n";
                        msg = msg +
                            "Perfect Weight ${minimumbmi.toStringAsFixed(2)} kg\n";
                        msg = msg +
                            "You need to burn ${burnWeight.toStringAsFixed(2)} kg";
                      }

                      else if (bmi < 18.5) {
                        msg = "You are UnderWeight !!\n";
                        // bgColor = Colors.red;
                        msg = msg +
                            "Perfect Weight ${minBmi.toStringAsFixed(2)} kg\n";
                        msg = msg +
                            "You need to gain ${gainWeight.toStringAsFixed(2)} kg";
                      } else {
                        msg = "You are Healthy !!\n";
                        // bgColor = Colors.green;
                      }

                      setState(() {
                        result = "Your BMI is ${bmi.toStringAsFixed(2)}" + "\n" + msg;
                        // result = result + "\n" + msg;
                      });
                    } else {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please fill all the required blanks !!'),
                          duration: Duration(seconds: 2),
                        ));
                      });
                    }
                  },
                  child: Text('Calculate', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(
                height: 11,
              ),
              Expanded(
                child: Text(
                  result,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
