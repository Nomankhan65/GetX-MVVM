import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
  UserPreferences userPreferences=UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('home'.tr),
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser();
            Get.toNamed(RoutesName.loginScreen);
          }, icon: const Icon(Icons.login_outlined))
        ],
      ),
      body:ListView.builder(
          itemCount:10,
          itemBuilder: (context,index){
        return   ListTile(
          leading:const Icon(Icons.ac_unit),
          title:Text('user $index'),
        );
      })
    );
  }
}
