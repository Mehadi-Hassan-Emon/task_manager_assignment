import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/login_page.dart';


////api e joto doroner kaj ache sob ei 2 ta dore call korle hoye jabe eta          //// but ager project e alada kore dekhano hoiselo

///api call kortase
class ApiCaller{

  static final Logger _logger  = Logger();

   //logger package use korsi and eta use hoi bcz error gula dekhar jonno


   static Future<ApiResponse>getRequest({required String url, }) async {
    try{
      Uri uri = Uri.parse(url);

      _logRequest(url);//logger

      Response  response = await get(uri,headers: {
        'token': AuthController.accessToken??''///token ta add korsi ekhane jate login er por token ta add new task e ashe //login er token ta authcontroller e save rakhsi oikhan theke access nicci
      });

      _logResponse(url,response);//logger

      final int statusCode = response.statusCode;//status code check korar jonno
      final decodedData = jsonDecode(response.body);

      if(statusCode == 200){

        return ApiResponse(
            responseCode:statusCode,
            isSuccess: true,
            responseData: decodedData
        );//statuscode mane 200,,isSuccess mane 200 hole condition ta true,,get e decode korte hoi jsoncode code ke
      }else if(statusCode==401 ){//401 ashle je anauthorized msg ashe ta remove kortasi
        await _movetoLogin();//401 hoile login page e move korbe
        return ApiResponse(
            responseCode:-1,
            isSuccess: false,
            responseData: null
        );
      }
      else{
        return ApiResponse(
            responseCode:statusCode,
            isSuccess: false,
            responseData:decodedData
        );//success nah hole eita hobe
      }
    }catch(e){
      return ApiResponse(
          responseCode:-1,
          isSuccess: false,
          responseData: null,
          errorMessage: e.toString()
      );//jodi api response nah ashe//try catch e check korbo
    }
  }


  //post//data paoya
 static Future<ApiResponse>postRequest({required String url, Map<String,dynamic>?body,}) async {//post e url er sathe data o lageh bcz post e data pass korte hoi
    try{
      Uri uri = Uri.parse(url);

      _logRequest(url,body: body);//logger

      Response  response = await post(uri,
        headers: {
          'Accept':'application/json',//postman e post theke
          'Content-Type' : 'application/json',

              'token': AuthController.accessToken??''//login er token ta onno api access paoyar jonno ekhane o add kora lagbe


        },
        body: body != null ? jsonEncode(body):null
      );
      _logResponse(url, response);//logger

      final int statusCode = response.statusCode;//status code check korar jonno
      final decodedData = jsonDecode(response.body);

      if(statusCode == 200 || statusCode == 201 ){

        return ApiResponse(responseCode:statusCode, isSuccess: true, responseData: decodedData);//statuscode mane 200,,isSuccess mane 200 hole condition ta true,,get e decode korte hoi jsoncode code ke
      } else if(statusCode==401 ){//401 ashle je anauthorized msg ashe ta remove kortasi
        await _movetoLogin();//401 hoile login page e move korbe
        return ApiResponse(
            responseCode:-1,
            isSuccess: false,
            responseData: null
        );
      }

      else{
        return ApiResponse(responseCode:statusCode, isSuccess: false, responseData:decodedData );//success nah hole eita hobe
      }
    }catch(e){
      return ApiResponse(responseCode:-1, isSuccess: false, responseData: null,errorMessage: e.toString());//jodi api response nah ashe//try catch e check korbo
    }
  }

  //request print logger
  static void _logRequest(String Url,{Map<String,dynamic>? body}){
     _logger.i(
       'URL => $Url\n'
       'Request Body=> $body\n',

     );
  }

  //response print logger

  static void _logResponse(String url, Response response) {
    _logger.i(
        'URL => $url\n'
            'Status Code => ${response.statusCode}\n'
            'Response Body => ${response.body}\n'
    );
  }
  //401 er jonno check
  static Future<void>_movetoLogin()async{
    await AuthController.clearUserData();//token nai but user er data thakle ta clean korbo
   Navigator.pushNamedAndRemoveUntil(TaskManager.navigator.currentContext!,'/Login', (predicate)=>false);//context ta nah ashai amra ap.dart e navigator state make kore ekhane ansi
   }


}



class ApiResponse{//api call korle ei format e data ta pabo
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse({required this.responseCode,required this.isSuccess,required this.responseData,this.errorMessage = 'Something wrong'});

}


