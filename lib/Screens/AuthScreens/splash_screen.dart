import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_cart/Screens/AuthScreens/login_screen.dart';
import 'package:my_cart/Screens/Widgets/bottom_nav_bar.dart';
import 'package:my_cart/Utils/colors.dart';
import 'package:my_cart/Utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Splash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   bool? isLogin = await prefs.getBool('isLogin');
   var accessToken1 = await prefs.getString('accessToken');
   var email1 = await prefs.getString('userEmail');

   accessToken = accessToken1;
   userEmail = email1;
   print('accessToken ====>>> ${accessToken1}');

    Future.delayed(Duration(seconds: 2),(){
      if (accessToken1 == null || accessToken1.isEmpty || isLogin == null || isLogin == false || email1 == null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar()));
      }

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
