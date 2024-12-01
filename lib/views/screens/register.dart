import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/register_controller.dart';
import 'package:pantry/views/screens/dashboard.dart';
import 'package:pantry/views/screens/login.dart';
import 'package:pantry/views/widgets/circularCard.dart';
import 'package:pantry/views/widgets/customInputText.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:pantry/views/widgets/gradient.dart';
import 'package:pantry/views/widgets/logo.dart';
import 'package:sign_in_button/sign_in_button.dart';

    RegisterController register = Get.put(RegisterController());
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController contact = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

class Register extends StatefulWidget {
  

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        alignment: Alignment.topLeft,
        children:[
          Container(
            margin: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    customText(text: 'Lets get started',
                    textWeight: FontWeight.w500,
                    textSize: 20,
                    textColor: primary,
                    ),
                      
                    SizedBox(height: 20),
                    // Text fields
                       customInputText(
                      control: firstname,
                      hint: 'Firstname',
                      userIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Please enter your firstname';
                        }
                        return null;
                      },
                      ),
                      SizedBox(width: 10,),
                    customInputText(
                      control: lastname,
                      hint: 'Enter your Lastname',
                      userIcon: Icons.person,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your lastname';
                        }
                        return null;
                      },
                    ),
                    customInputText(
                      control: email,
                      hint: 'Enter your Email',
                      userIcon: Icons.email,
                       validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      ),
                    customInputText(
                      control: contact,
                      hint: 'Enter your Contact',
                      userIcon: Icons.phone,
                       validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your contact';
                        } else if (!value.isNumericOnly || value.length != 10) {
                          return 'Please enter your number in the form 07123456789';
                        }
                        return null;
                      },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Column(
                          children: [
                    Obx(() =>
                      TextFormField(
                              obscureText: register.passwordHidden.value,
                              controller: password,
                              decoration: InputDecoration(
                                hintText: 'Enter password',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                                filled: false,
                                fillColor: white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: grey),
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                prefixIcon: const Icon(
                                 Icons.lock,
                                  color: primary,
                                ),
                                suffixIcon: InkWell(
                                  child: Icon(register.passwordHidden.value ? Icons.visibility :
                                  Icons.visibility_off,
                                  color: grey,
                                  size: 20),
                                  onTap: () {
                                       register.passwordHidden.value = !register.passwordHidden.value;
                                  },
                                )
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                    ),
                    SizedBox(height: 10),
                      Obx(() =>
                        TextFormField(
                              obscureText: register.passHidden.value,
                              controller: confirmPassword,
                              decoration: InputDecoration(
                                hintText: 'Confirm password',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                                filled: false,
                                fillColor: white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: grey),
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                prefixIcon: const Icon(
                                 Icons.lock,
                                  color: primary,
                                ),
                                suffixIcon: InkWell(
                                  child: Icon(register.passHidden.value ? Icons.visibility :
                                  Icons.visibility_off,
                                  color: grey,
                                  size: 20),
                                  onTap: () {
                                       register.passHidden.value = !register.passHidden.value;
                                  },
                                )
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return 'Please confirm your password';
                                } else if (password.text != value) {
                                  return 'Passwords are not equal';
                                } else {
                                  return null;
                                }
                              },
                            ),
                      ),
                    ]
                        )
                      ),
                      SizedBox(height: 10.0,),
                     ElevatedButton(onPressed: (){
                        if (_formKey.currentState!.validate()) {
                        // pass to controller to handle changes
                        register.registerUser(
                          firstname: firstname.text,
                          lastname: lastname.text,
                          email: email.text,
                          contact: contact.text,
                          pass1: password.text,
                          pass2: confirmPassword.text,
                          );
                          // show circular progress bar indicator while waiting for data to be processed
                          clearText();
                        }
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 3,
                        foregroundColor: white,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                         )
                      ),
                      child: Text('SIGN UP')),
                     SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            )
                          ),
                          ),
                          const SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () {Get.to(() => const Login());},
                            child: Text('Sign In',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              )
                            ),
                            ),
                          )
                        ],
                        
                      ),
                      const SizedBox(height: 10,),
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
                      const SizedBox(height: 10.0),
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
          ),
          Obx(() {
              if (register.isLoading.value) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.black54.withOpacity(0.5),
                  child: Circularcard(message: 'Hang on Tight! Getting things ready for you.'));
              } else {
             return SizedBox.shrink();
              }
          }),
        ]
      ),
      );
  }
  void clearText(){
    firstname.clear();
    lastname.clear();
    email.clear();
    contact.clear();
    password.clear();
    confirmPassword.clear();
  }
}

