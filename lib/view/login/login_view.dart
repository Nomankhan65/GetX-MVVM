import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel=Get.put(LoginViewModel());
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        title:const Text('Login'),
        centerTitle:true,
      ),
      body:  Form(
        key:formKey,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              child: TextFormField(
                controller:loginViewModel.emailController.value,
                focusNode:loginViewModel.emailFocusNode.value,
                validator:(val){
                  if(val!.isEmpty){
                    Utils.getSnackBar(String,'Email','Enter email');
                  }
                },
                onFieldSubmitted:(val){
                  Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                },
                decoration:InputDecoration(
                  hintText:'email_hint'.tr,
                  border:const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              child: TextFormField(
                controller:loginViewModel.passwordController.value,
                focusNode:loginViewModel.passwordFocusNode.value,
                validator:(val){
                  if(val!.isEmpty){
                    Utils.getSnackBar(String,'Password','Enter Password');
                  }
                },
                decoration:InputDecoration(
                  hintText:'password_hint'.tr,
                  border:const OutlineInputBorder(),
                ),
              ),
            ),
            
            SizedBox(
              width:double.infinity,
              height:50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child:Obx(() => ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    loginViewModel.loginApi();
                  }
                }, child:loginViewModel.loading.value?const CircularProgressIndicator():const Text('Login')),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
