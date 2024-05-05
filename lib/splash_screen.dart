import 'package:flutter/material.dart';
import 'constant.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bm2.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(0.7),
              ],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(textAlign: TextAlign.center,'Stay Informed! Calculate Your BMI Today',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                SizedBox(height: 20,),
                Text(textAlign: TextAlign.center,'Calculate your Body Mass Index (BMI) quickly and easily to understand your current health status. Ditch the confusion, uncover your BMI, and take control of your health!',style: TextStyle(fontSize: 16,color: Colors.grey[600],fontWeight: FontWeight.w500),),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'BMI Calculator',)));
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                      color: Constants.navColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(child: Text('Get Started',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}