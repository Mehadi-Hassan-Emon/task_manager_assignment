import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/forget_password_verify_otp_screen.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<
      FormState>(); 


  bool _signUpProgress = false; 
  _clearTextField() {
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
    _passwordController.clear();
  }

  ///Api///
  Future<void> _signUp() async {
    setState(() {
      _signUpProgress = true; 
    });

    Map<String, dynamic>requestBody = {
      "email": _emailController.text,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "mobile": _mobileController.text,
      "password": _passwordController.text,
    };
    //Api response
    final ApiResponse response = await ApiCaller.postRequest(
       url: Urls.registrationUrl,
       body: requestBody,
    );
    setState(() {
      _signUpProgress = false; 

    });
    
    if (response.isSuccess) {
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up success..!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),

      );

    }
    String errorMessage;
    if (response.responseData is Map<String, dynamic>) {
      errorMessage = response.responseData['data'];
    } else {
      errorMessage = response.responseData.toString();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _fromKey,

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150,),
                    Text('Join with us',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge, 
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',

                      ),
                      validator: (
                          String ? value) { 
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        final emailRegExp = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                        

                        if (!emailRegExp.hasMatch(
                            value)) { 
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                        ),
                        validator: (
                            String ? value) { 
                          if (value == null || value.isEmpty) {
                            return 'please enter your first name';
                          }
                          if (value
                              .trim()
                              .length <
                              2) { 
                            return 'First name must be at least 2 charecter';
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                        ),
                        validator: (
                            String ? value) { 
                          if (value == null || value.isEmpty) {
                            return 'please enter your last name';
                          }
                          if (value
                              .trim()
                              .length <
                              2) { 
                            return 'last name must be at least 2 charecter';
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                        controller: _mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile',
                        ),
                        validator: (
                            String ? value) { 
                          if (value == null || value.isEmpty) {
                            return 'please enter your mobile number';
                          }
                          if (value
                              .trim()
                              .length !=
                              11) {
                            return 'Enter valid phone Number';
                          }
                          return null;
                        }
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        validator: (
                            String ? value) { 
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          }
                          if (value.length <=
                              6) { 
                            return 'Enter password more than 6';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 16,),

                    Visibility(
                      visible: !_signUpProgress,
                      replacement: Center(child: CircularProgressIndicator()),

                      child: FilledButton(onPressed: () {
                      
                        if (_fromKey.currentState!.validate()) {
                          _signUp();
                        }
                      }, child: Icon(Icons.arrow_circle_right_outlined,),),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText( 
                              text: TextSpan(
                                  text: ' Already Have Account',
                                  children: [
                                    TextSpan(
                                        text: 'Sign in',
                                        style: TextStyle(
                                          color: Colors.green,
                                        )
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
  _firstNameController.dispose();
  _lastNameController.dispose();
  _mobileController.dispose();
  _passwordController.dispose();
    super.dispose();
  }
}
//sign up e click korle ei page ashbe ,,sign up holo login page e


