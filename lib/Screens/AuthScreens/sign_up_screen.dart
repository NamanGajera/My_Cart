import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/Screens/AuthScreens/login_screen.dart';

import '../../Utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double main_height = MediaQuery.of(context).size.height;
    double main_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_image.png',
            ),
            Text(
              'Creat An Account!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                height: 0.1,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  controller: emailController,
                  cursorColor: primaryYellowColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: greyTextColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryGreenColor),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: greyBackgroundColor,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: greyTextColor,
                      fontSize: 15,
                    ),),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  controller: passwordController,
                  cursorColor: primaryYellowColor,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: greyTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryGreenColor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: greyBackgroundColor,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: greyTextColor,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  controller: rePasswordController,
                  cursorColor: primaryYellowColor,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: greyTextColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: primaryGreenColor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: greyBackgroundColor,
                      ),
                      labelText: 'Conform Password',
                      labelStyle: TextStyle(
                        color: greyTextColor,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
              decoration: BoxDecoration(
                color: primaryYellowColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('SIGN UP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
            ),
            SizedBox(height: 100),
            RichText(text: TextSpan(
                text: 'All ready have an account?  ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                  )
                ]
            ),),
          ],
        ),
      ),
    );
  }
}
