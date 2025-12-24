import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/login_page.dart';
import 'package:task_manager/ui/utils/asset_paths.dart';
import 'package:task_manager/ui/widget/screen_background.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>_moveToNextScreen()async{
    await Future.delayed(Duration(seconds: 2));

    
    final bool isLoggedIn = await AuthController.isUserLogIn();
    if(isLoggedIn){
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
      ScreenBackground(child: Center(child: SvgPicture.asset(AssetPaths.logo2,height: double.maxFinite,width: double.maxFinite,))
      ),
    );
  }
}
