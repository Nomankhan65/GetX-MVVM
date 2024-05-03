import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
    SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices splashServices=SplashServices();
    splashServices.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:Center(child:Text('welcome_back'.tr),),
    );
  }
}
