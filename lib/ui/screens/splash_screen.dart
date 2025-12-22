import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/login_page.dart';
import 'package:task_manager/ui/utils/asset_paths.dart';
import 'package:task_manager/ui/widget/screen_background.dart';//flutter svg theke path version copy kore pubsspec yaml e paste korse
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>_moveToNextScreen()async{//onno ekta screen e jabe koiak second por
    await Future.delayed(Duration(seconds: 2));

    ///AuthController er isuserlogin ta check kortasi//jehetu etar ageh login page ta 2 tar modde authcontroller er method diye check kortasi
    final bool isLoggedIn = await AuthController.isUserLogIn();//isLoggesd object er bitore isuserlogin ta rakhsi
    if(isLoggedIn){//jodi is Loggedin true hoi
      Navigator.pushReplacementNamed(context, '/NavBar');

    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=> LoginPage()));

    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:
      //Stack(
      //   children: [
      //     SvgPicture.asset(AssetPaths.backgroundSvg,//assets_paths file theke paisi//svg picture add korte eita use hoi
      //       width:double.maxFinite,
      //       height:double.maxFinite,
      //     ),
      ScreenBackground(child: Center(child: SvgPicture.asset(AssetPaths.logo2,height: double.maxFinite,width: double.maxFinite,))//Screenbackground er bitore background.svg ta ache so amra just eta call kore je page e text likhte hobe text likhbo ar je page just amader logo boshate hobe just logo boshabo
      ),
    );
  }
}
