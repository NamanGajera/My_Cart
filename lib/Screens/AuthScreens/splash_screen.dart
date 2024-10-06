import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cart/Screens/AuthScreens/login_screen.dart';
import 'package:my_cart/Utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Splash();
  }

  Splash(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    double main_height = MediaQuery.of(context).size.height;
    double main_width = MediaQuery.of(context).size.width;
    return Container(
      height: main_height,
      width: main_width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/main_logo.png',
        height: 180,
        width: 180,
      ),
    );
  }
}
