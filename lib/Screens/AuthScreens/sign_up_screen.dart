import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cart/Bloc/AuthBloc/sign_up_screen_bloc.dart';
import 'package:my_cart/Models/AuthScreenModels/SignUpModel.dart';
import 'package:my_cart/Screens/AuthScreens/login_screen.dart';
import 'package:my_cart/Screens/Widgets/bottom_nav_bar.dart';
import 'package:my_cart/Services/api_handler.dart';
import 'package:my_cart/Utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  SignUpScreenBloc signUpScreenBloc =
      SignUpScreenBloc(ApiHandler.createInstance());
  SignUpModel? signUpModel;



  @override
  Widget build(BuildContext context) {
    double main_height = MediaQuery.of(context).size.height;
    double main_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<SignUpScreenBloc>(
        create: (context) => signUpScreenBloc..add(SignUpScreenInitialEvent()),
        child: BlocListener<SignUpScreenBloc, SignUpScreenState>(
          listener: (context, state) {
            if (state is APIFailureState) {
              Helper.showErrorDialog(context, (){Navigator.of(context).pop();}, '${state.errorMessage}',);
            }
            if (state is SignUpEventState) {

              Future.delayed(Duration(milliseconds: 500), () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              });
            }
          },
          child: signUpScreen(),
        ),
      ),
    );
  }

  Widget signUpScreen() {
    double main_height = MediaQuery.of(context).size.height;
    double main_width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
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
                  ),
                ),
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
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: greyTextColor,
                      fontSize: 15,
                    )),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              if (emailController.text.isEmpty) {
                Helper.showToastMessage('Enter A Email');
              } else if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(emailController.text.trim())) {
                Helper.showToastMessage('Enter a valid email');
              } else if (passwordController.text.isEmpty) {
                Helper.showToastMessage('Enter A Password');
              } else if (rePasswordController.text.isEmpty) {
                Helper.showToastMessage('Enter A Confirm Password');
              } else if (rePasswordController.text.toLowerCase() !=
                  passwordController.text.toLowerCase()) {
                Helper.showToastMessage('Passwords do not match');
              } else {
                print('signUp Data===>>> ${{
                  'email': '${emailController.text.trim()}',
                  'password': '${passwordController.text.trim()}',
                }}');

                signUpScreenBloc.add(SignUpEvent({
                  'email': '${emailController.text.trim()}',
                  'password': '${passwordController.text.trim()}',
                }));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              decoration: BoxDecoration(
                color: primaryYellowColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          RichText(
            text: TextSpan(
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        })
                ]),
          ),
        ],
      ),
    );
  }
}
