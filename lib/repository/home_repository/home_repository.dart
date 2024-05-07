import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository{
  final apiServices=NetworkApiServices();

  Future<dynamic> userLisApi()async{
    dynamic response=await apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }
}