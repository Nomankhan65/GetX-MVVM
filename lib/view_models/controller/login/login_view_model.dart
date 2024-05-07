import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController{

  UserPreferences userPreferences=UserPreferences();
  final _api=LoginRepository();
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
  RxBool loading=false.obs;
  void loginApi(){
    loading.value=true;
    Map data={
      'email':emailController.value.text,
      'password':passwordController.value.text,
    };
    _api.loginApi(data).then((value){
      loading.value=false;
      if(value['error']=='user not found'){
        Utils.getSnackBar(String,'Invalid email','user not found!');
      }
      else{
        UserModel userModel=UserModel(
          token:value['token'],
          isLogin:true,
        );
        userPreferences.saveUser(userModel).then((value) {
          Get.toNamed(RoutesName.homeScreen);
        });
        print(value.toString());
      }

    }).onError((error, stackTrace){
      loading.value=false;
      Utils.getSnackBar(String,"Error",error.toString());
      print(error.toString());
    });
  }
}