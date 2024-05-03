import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode  current ,FocusNode next ){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    gravity:ToastGravity.BOTTOM,
      backgroundColor:AppColor().blackColor
    );
  }

  static getSnackBar(String,title,String message)
  {
    Get.snackbar(
      title,
      message,
      backgroundColor:Colors.lightBlueAccent,
      colorText:Colors.white,
    );
  }
}