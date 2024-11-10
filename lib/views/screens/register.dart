import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/register_controller.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/widgets/customButton.dart';
import 'package:pantry/views/widgets/customInputText.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:pantry/views/widgets/gradient.dart';
import 'package:pantry/views/widgets/logo.dart';
import 'package:sign_in_button/sign_in_button.dart';


TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController contact = TextEditingController();
TextEditingController password = TextEditingController();

Registercontroller reg = Registercontroller();

class Register extends StatelessWidget {
  

  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children:[ 
          Container(
            margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.contain)
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(40.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  customText(text: 'Let\s get started',
                  textWeight: FontWeight.w500,
                  textSize: 20,
                  textColor: primary,
                  ),
                    
                  SizedBox(height: 20),
                  // Text fields
                  customInputText(
                    control: firstname,
                    hint: 'FirstName',
                    ),
                  customInputText(
                    control: lastname,
                    hint: 'Lastname',
                    top: 10,
                  ),
                  customInputText(
                    control: email,
                    hint: 'Email',
                    userIcon: Icons.email,
                    top: 10),
                  customInputText(
                    control: contact,
                    hint: 'Contact',
                    userIcon: Icons.phone,
                    top: 10),
                  customInputText(
                    control: password,
                    hint: 'Password',
                    userIcon: Icons.lock,
                    top: 10),
                    
                    const SizedBox(height: 20.0,),
                    Custombutton(nextPage: Login(), buttonName: 'SIGN UP'),
                    SizedBox(height: 20.0,),
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
                    customText(text: 'Sign up using: ',
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
          ),
        ]
      ),
      );
  }
}