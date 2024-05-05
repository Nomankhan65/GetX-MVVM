import 'package:get/get.dart';

class Languages extends Translations{

  @override
  Map<String,Map<String,String>> get keys=>
      {
        'en_US':{
          'name':'Enter Name',
          'welcome_back':'welcome back',
          'email_hint':'Email',
          'password_hint':'Password',
          'login':'Login',
          'home':'home screen',
        },
        'ur_PK':{
          'name':'نام درج کریں'
        }
      };
}