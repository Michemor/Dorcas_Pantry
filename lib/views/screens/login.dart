
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/screens/register.dart';
import 'package:pantry/views/widgets/customButton.dart';
import 'package:pantry/views/widgets/customInputText.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:sign_in_button/sign_in_button.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkPass = false;
  bool rememberMe = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
        Container(
          margin: EdgeInsets.fromLTRB(100, 0, 100, 20),
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dorcas_white.png'),
              fit: BoxFit.contain),
              shape: BoxShape.rectangle,
          ),
        ),
          SingleChildScrollView(
                child: Container(
                margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    SizedBox(height: 20.0),
                    customText(text: 'Welcome', textColor: primary), 
                     SizedBox(height: 20),
                  customInputText(control: username,
                  hint: 'Enter username',
                  ),
                  customInputText(control: password,
                  hint: 'Enter your password',
                  top: 20,
                  showPass: true,
                  userIcon: Icons.lock,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: rememberMe, 
                          onChanged: (value) {
                            setState((){rememberMe = value ?? false;});
                            },
                            checkColor: white,
                            activeColor: primary,
                            ),
                            customText(text: 'Remember Me',
                            textSize: 13,
                            textWeight: FontWeight.w400),
                            Spacer(flex: 1),
                            GestureDetector(
                              child: customText(text: 'Forgot Password?',
                            textSize: 11,
                            textWeight: FontWeight.w400),
                            ),
                      ],
                    ),
                  ),

                  // Sign in button 
                  Custombutton(nextPage: Dashboard(), buttonName: "SIGN IN"),

                  SizedBox(height: 20.0,),

                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     customText(text: 'Don\'t have an account?',
                  textWeight: FontWeight.w200,
                  textSize: 12,
                  textColor: Colors.black87,
                  ),
                  GestureDetector(
                   onTap: () {
                     Get.to(() => Register());
                   },
                   child: customText(text: 'Sign Up',
                   textSize: 12,
                   textWeight: FontWeight.w500),
                   ),
                   ],
                  ),
                  SizedBox(height: 10),

                  // start of divider for other sign in options
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                 const Expanded(
                   child: Divider(
                     indent: 20.0,
                     endIndent: 20.0,
                     thickness: 1.5,
                     height: 20,
                   ),
                 ),
                  customText(text: 'OR', 
                 textWeight: FontWeight.w200,
                 textColor: Colors.black,
                 textSize: 13,
                 ),
                  const Expanded(
                   child: Divider(
                     indent: 20.0,
                     endIndent: 30.0,
                     thickness: 1.5,
                     height: 20,
                   ),
                 ),
                   ]
                ),
                // sign in using google, microsoft or facebook
                SizedBox(height: 20.0),
                customText(text: 'Sign in with: ',
                textSize: 13,
                textColor: primary,
                textWeight: FontWeight.w500
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SignInButton(
                    Buttons.facebook, 
                    mini: true,

                    onPressed: () {},
                   ),
                  SignInButton(
                    Buttons.linkedIn, 
                    mini: true,

                    onPressed: () {},
                   ),
                   SignInButton(
                    Buttons.email, 
                    mini: true,
                    onPressed: () {},
                   ), 
                  ],
                ),
                  ]
              ),
            ),
          )
        ],
      ),
      );
}
}

_signInGoogle () {

}

_siginMicrosoft () {

}

_siginFacebook() {

}