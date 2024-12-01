
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/login_controller.dart';
import 'package:pantry/views/screens/register.dart';
import 'package:pantry/views/widgets/circularCard.dart';
import 'package:pantry/views/widgets/customInputText.dart';
import 'package:pantry/views/widgets/customText.dart';
import 'package:sign_in_button/sign_in_button.dart';

final store = GetStorage();
LoginController login = Get.put(LoginController());
TextEditingController email= TextEditingController();
TextEditingController password = TextEditingController();
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void clearText(){
    email.clear();
    password.clear();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        alignment: Alignment.topLeft,
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
                margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ 
                      SizedBox(height: 20.0),
                  
                      //Text for welcoming 
                      customText(text: 'Welcome Back', textColor: primary), 
                       const SizedBox(height: 20),
                  
                       // text field for username
                  customInputText(
                      control: email,
                      hint: 'Enter email',
                      userIcon: Icons.email,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  
                    // text field for the password
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Obx(() =>
                      TextFormField(
                            obscureText: login.isPasswordHidden.value,
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
                                child: Icon(login.isPasswordHidden.value ? Icons.visibility :
                                Icons.visibility_off,
                                color: grey,
                                size: 20),
                                onTap: () {
                                  login.isPasswordHidden.value = !login.isPasswordHidden.value;
                                },
                              )
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your password';
                              } else {
                                return null;
                              }
                            },
                          ),
                    ),
                  ),
                    const SizedBox(
                    height: 10),
                    // container after text fields 
                  
                               // --------- FORGOT PASSWORD ---------
                   GestureDetector(
                    child: customText(text: 'Forgot Password?',
                    textSize: 11,
                    textWeight: FontWeight.w400),
                   ),
                   const SizedBox(
                    height: 20),
                   ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()){
                    login.handleLogin(
                      email: email.text, 
                      password: password.text);
                    clearText();
                      }
                  }, 
                    style: ElevatedButton.styleFrom(
                   backgroundColor: primary, 
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0)
                   )
                                 ),
                      
                      child: Text('SIGN IN',
                      style: GoogleFonts.roboto(
                         color: white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14)
                      ),
                     ),
                  
                    const SizedBox(height: 20.0,),
                  
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       customText(text: 'Don\'t have an account?',
                    textWeight: FontWeight.w200,
                    textSize: 12,
                    textColor: Colors.black87,
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                     onTap: () {
                       Get.to(() => const Register());
                     },
                     child: customText(text: 'Sign Up',
                     textSize: 12,
                     textWeight: FontWeight.w500),
                     ),
                     ],
                    ),
                    const SizedBox(height: 10),
                  
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
            ),
          ),
          Obx(() {
            if (login.isLoading.value) {
              return Container(
                alignment: Alignment.center,
                color: Colors.black54.withOpacity(0.5),
                child: Circularcard(message: 'Hang on tight while we get things ready for you',),
              );
            } else {
              return SizedBox.shrink();
            }
          })
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

// used when reading the value the user has written
/**
 * readInitialSettings async() {
 *    final SharedPreferences sharedPrefs =  await SharedPreferences.getInstance();
 *    String storedUserName = sharedPrefs.getString("username") ?? '';
 * 
 *    return storedUserName;
 * }
 * 
 */