import 'package:get/get.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

import '../../../data/response/status.dart';

class HomeViewModel extends GetxController{

  final _api=HomeRepository();

  final requestStatus=Status.LOADING.obs;
  final userList=UserListModel().obs;
  RxString error=''.obs;

  void setRequestStatus(Status status)=>requestStatus.value=status;
  void setUserList(UserListModel userListModel)=>userList.value=userListModel;
  void setError(String value)=>error.value=value;


  void userListApi(){
    _api.userLisApi().then((value){
      setRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
      setRequestStatus(Status.ERROR);
      setError(error.toString());
      print(error.toString());
    });
  }

  void refreshApi(){
    setRequestStatus(Status.LOADING);
    _api.userLisApi().then((value){
      setRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error, stackTrace){
      setRequestStatus(Status.ERROR);
      setError(error.toString());
      print(error.toString());
    });
  }
}