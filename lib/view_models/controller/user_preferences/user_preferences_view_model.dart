
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future<bool> saveUser(UserModel userModel)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token',userModel.token.toString());
    sp.setBool('isLogin', userModel.isLogin!);
    return true;
  }

  Future<UserModel> getuser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? token =sp.getString('token');
    bool? isLogin=sp.getBool('isLogin');
    return UserModel(
      token:token,
      isLogin:isLogin,
    );
  }

  Future<bool> removeUser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}