import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/ui/screens/forget_password_email_verify.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widget/screen_background.dart';

import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../controller/auth_controller.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();//controller
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _signInProgress = false;
  _clearTextField() {
    _emailController.clear();
    _passwordController.clear();
  }
  ///Api///
  Future<void> _signIn() async {
    setState(() {
      _signInProgress = true; //api er bitore true mane kaj kortache

    });

    Map<String, dynamic>requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
    };
    //Api response
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );
    setState(() {
      _signInProgress = false; //api er bahire sesh tai false kore dibo

    });
    ///success hole msg ta dekhabe eita alada concept
    if (response.isSuccess) {

      //authController e je data and token save korsi oita ekhane show korabo//login same data diye korle jate chinte pare
      UserModel model = UserModel.fromjson(response.responseData['data']);//access paoyar jonno UserMdoel make korse ar 'data' bitore tob kichu ache postman e tai eibabe dise
      String accessToken= response.responseData['token'];//access paoyar jonno accesstoken make korse 'token' postman er login e niche pabo tai eibabe dise
      await  AuthController.saveUserData(model, accessToken);
      //ekhon jokhon login hobe tokhon user theke data ta save rakhbe and sathe token tao



      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login success..!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),

      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavBarHolderScreen()));

      // ek email 2bar submit dile eita dekhabe user ke
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData["data"]),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),

      );
    }

  }



  @override
  Widget build(BuildContext context) {
    //sign up e click korle sign up screen page e jabe,, tai sign e gesture use kore clickable korse and tar jonno ekta method dorkar
    void _onTabSignUp(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    }



    //forget email verify
    void _onTapForgetPassword(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVerify()));
    }






    return Scaffold(
      body: ScreenBackground(//screen background theke ei name er ekta widget make kora ache ta use korsi
          child: Padding(
            padding: EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Form(
                key: _fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150,),
                    Text('Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
                    ),
                    const SizedBox(height: 25,),

                    TextFormField(//just eita disi bcz app.dart e amra theme use korsi tai oi onujayi sob page e draw hobe just Text gula changing ashbe
                     controller: _emailController,
                      decoration: InputDecoration(

                        hintText: 'Email',

                    ),
                      validator: (
                          String ? value) { //validator use kore input check kore null mane khali kina
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        final emailRegExp = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                        ///email e eigula thaka lagbe

                        if (!emailRegExp.hasMatch(
                            value)) { // emailRegExp match nah kore
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                  const SizedBox(height: 20,),


                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password'
                      ),
                        validator: (
                            String ? value) { //validator use kore input check kore null mane khali kina
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          }
                          if (value.length <=
                              6) { //trim mane word e space thakle ta remove kore dei
                            return 'Enter password more than 6';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 20,),
                    FilledButton(onPressed: (){
                      if (_fromKey.currentState!.validate()) {
                        _signIn();
                      }
                    }, child: Icon(Icons.arrow_circle_right_outlined,),),
                    const SizedBox(height: 20,),
                    Center(
                      child: Column(
                        children: [
                          TextButton(onPressed: _onTapForgetPassword, child:  Text('Forget Password')),//forget password e click korle Forget password page e jabe
                          RichText(          //multiple text and text color neya jai
                              text: TextSpan(
                                  text: 'Dont have an account? ',
                                  children: [
                                    TextSpan(
                                        text:'Sign Up',
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      recognizer: TapGestureRecognizer()..onTap = _onTabSignUp
                                    )
                                  ],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
//forget password e click korle forget pasword emial verify page e jabe









