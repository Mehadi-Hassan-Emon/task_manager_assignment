import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forget_password_verify_otp_screen.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                Text('Set Password',
                  style: Theme.of(context).textTheme.titleLarge,//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
                ),
                const SizedBox(height: 7,),
                Text('Password should be more than 6 letters and combinations of numbers',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),//font boro kora// (TextTheme class) website e ache kibabe text boro kora jai
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
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
//reset pass