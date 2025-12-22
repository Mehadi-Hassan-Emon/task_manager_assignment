import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/login_page.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();//globalkey api caller page e access nise simple eta

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,//theme er main part gula green hobe ,,,sob page e jate alada kore green korte na hoi tai app.dart eikhane green kore dise ageh theke
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),

          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,

              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              )
          ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        )

      ),
      //home: SplashScreen(),

      initialRoute: '/splashScreen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splashScreen':(_) =>SplashScreen(),
        '/Login':(_) =>LoginPage(),
        '/signUp':(_) =>SignUpScreen(),
        '/NavBar':(_) =>MainNavBarHolderScreen(),
        '/updateProfile':(_) =>UpdateProfileScreen(),




      },
    );
  }
}
