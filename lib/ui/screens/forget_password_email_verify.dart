import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forget_password_verify_otp_screen.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
class ForgetPasswordEmailVerify extends StatelessWidget {
  const ForgetPasswordEmailVerify({super.key});

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
                Text('Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
                ),
                const SizedBox(height: 7,),
                Text('A 6 digits OTP will be sent to your email Address',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 16,),
                FilledButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordVerifyOtpScreen()));
                }, child: Icon(Icons.arrow_circle_right_outlined,),),
                const SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      RichText(          //multiple text and text color neya jai
                          text: TextSpan(
                              text: 'Already have an account? ',
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
//email e click kore submit korle forget password  verify otp screen page e jabe