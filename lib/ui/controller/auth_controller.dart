import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model.dart';

class AuthController{
  static String _accessTokenKey  ='token';
  static String _userModelKey  ='user-data';

  static String ? accessToken;//puro project e access korte keyword ta make korche
  static UserModel ? userModel;

  static Future saveUserData(UserModel model,String token)async{//save kore rakhtasi token and usermodel ta
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();//sharereference e token and Usermodel save rakhte hole pub e add korte hobe erpor ekhane ekta object make korte hobe
    await sharedPreferences.setString(_accessTokenKey, token);//set korte setstring use hoi //token ta set korse
    await sharedPreferences.setString(_accessTokenKey, jsonEncode(model.toJson()));
    accessToken  = token;
    userModel = model;
  }
  //access
  static Future getUserData()async{//saveUserDatar data gula use korar jonno
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token= sharedPreferences.getString(_accessTokenKey);///get mane setString er data gula paoya
////
    if(token != null){
      String ? userData =await sharedPreferences.getString(_userModelKey);//data ta get mane paitasi
      userModel =UserModel.fromjson(jsonDecode(userData!));//usermodel theke je data ashbe oita api te pass kore dibo
    }
  }
  ///
  static Future<bool> isUserLogIn()async{//mainly amra logout korle shared preferance je data save kore rekhe de ta jate next time clear kore dei tai ei part ta
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();//app login achr kina check korbo tai sharedpreferance e data save ache kina dekhtasi
    String ? token= sharedPreferences.getString(_accessTokenKey);//data token thakle bujbo user ta login obothai ache
    return token != null;//token null true hole login ache false hole login nai

  }
  static Future<void>clearUserData()async{//eibar amra logout er data gula check korbo
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
