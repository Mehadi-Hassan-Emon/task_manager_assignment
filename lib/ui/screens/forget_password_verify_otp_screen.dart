import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/forget_password_verify_otp_screen.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
class ForgetPasswordVerifyOtpScreen extends StatelessWidget {
  const ForgetPasswordVerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                Text('PIN Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 7,),
                Text('A 6 digits OTP sent to your email Address',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10,),


                PinCodeTextField(

                  length: 6,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.grey.shade300,
                    selectedColor: Colors.green
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  appContext: context,
                ),





                const SizedBox(height: 16,),
                FilledButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ResetPasswordScreen()));
                }, child: Icon(Icons.arrow_circle_right_outlined,),),
                const SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      RichText(          
                          text: TextSpan(
                              text: 'Already have an acoount? ',
                              children: [
                                TextSpan(
                                    text:'Sign in',
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
          )
      ),
    );
  }
}
//eitar jonno ekta pin code fields,,, package use kora hoiche pubspac ymal
