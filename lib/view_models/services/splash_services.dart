import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices{
  UserPreferences userPreferences=UserPreferences();
  void isLogin(){
    userPreferences.getuser().then((value) {
       if(value.isLogin==false || value.isLogin.toString()=='null'){
         Timer(const Duration(seconds:1), ()=>Get.toNamed(RoutesName.loginScreen));
       }else{
         Timer(const Duration(seconds:2), ()=>Get.toNamed(RoutesName.homeScreen));
       }
    });

  }
}