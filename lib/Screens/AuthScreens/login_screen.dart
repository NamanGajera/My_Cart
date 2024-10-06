import 'package:flutter/material.dart';
import 'package:my_cart/Utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              'Welcome Back!',
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
                      labelText: 'Enter Your Email',
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
                        Icons.lock,
                        color: greyBackgroundColor,
                      ),
                      labelText: 'Enter Your Password',
                      labelStyle: TextStyle(
                        color: greyTextColor,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 18,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80,vertical: 10),
              decoration: BoxDecoration(
                color: primaryYellowColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('LOGIN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
            ),
            SizedBox(height: 100),
            RichText(text: TextSpan(
              text: 'Don’t have an account yet?  ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ]
            ),),
          ],
        ),
      ),
    );
  }
}
