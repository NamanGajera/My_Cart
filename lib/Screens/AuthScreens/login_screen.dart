import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cart/Models/AuthScreenModels/login_model.dart';
import 'package:my_cart/Screens/AuthScreens/sign_up_screen.dart';
import 'package:my_cart/Screens/Widgets/bottom_nav_bar.dart';
import 'package:my_cart/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/AuthBloc/sign_up_screen_bloc.dart';
import '../../Models/AuthScreenModels/SignUpModel.dart';
import '../../Services/api_handler.dart';
import '../../Utils/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpScreenBloc signUpScreenBloc =
  SignUpScreenBloc(ApiHandler.createInstance());
  LoginModel? loginModel;
  @override
  Widget build(BuildContext context) {
    double main_height = MediaQuery.of(context).size.height;
    double main_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:BlocProvider<SignUpScreenBloc>(
        create: (context) => signUpScreenBloc..add(SignUpScreenInitialEvent()),
        child: BlocListener<SignUpScreenBloc, SignUpScreenState>(
          listener: (context, state) {
            if (state is APIFailureState) {
              Helper.showErrorDialog(context, (){Navigator.of(context).pop();}, '${state.errorMessage}',);
            }
            if (state is LoginEventState) {
              loginModel = state.loginModel;
              Future.delayed(Duration(milliseconds: 500), () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', true);
                await prefs.setString('accessToken', '${loginModel?.token}');
                await prefs.setString('userEmail', '${loginModel?.email}');
                print('sdsfsfd=========>>> ${loginModel?.email}');
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => BottomNavBar(),
                ));
              });
            }
          },
          child: loginScreen(),
        ),
      ),
    );
  }

  Widget loginScreen(){
    return  SingleChildScrollView(
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
          GestureDetector(
            onTap: (){
              if (emailController.text.isEmpty) {
                Helper.showToastMessage('Enter A Email');
              } else if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(emailController.text.trim())) {
                Helper.showToastMessage('Enter a valid email');
              } else if (passwordController.text.isEmpty) {
                Helper.showToastMessage('Enter A Password');
              } else {
                print('signUp Data===>>> ${{
                  'email': '${emailController.text.trim()}',
                  'password': '${passwordController.text.trim()}',
                }}');

                signUpScreenBloc.add(LoginEvent({
                  'email': '${emailController.text.trim()}',
                  'password': '${passwordController.text.trim()}',
                }));
              }
            },
            child: Container(
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
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                )
              ]
          ),),
        ],
      ),
    );
  }
}
