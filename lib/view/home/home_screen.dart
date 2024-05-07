import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

import '../../data/response/status.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferences userPreferences=UserPreferences();

  final homeViewModel=Get.put(HomeViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        title:Text('home'.tr,style:const TextStyle(color:Colors.white),),
        backgroundColor:Colors.lightBlueAccent,
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser();
            Get.toNamed(RoutesName.loginScreen);
          }, icon: const Icon(Icons.login_outlined,color:Colors.white,))
        ],
      ),
      body:Obx((){
        switch(homeViewModel.requestStatus.value){
          case Status.LOADING:
            return const Center(child:CircularProgressIndicator(),);
          case Status.ERROR:
            if(homeViewModel.error.value=='No Internet'){
              return Center(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                 crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                Text(homeViewModel.error.toString()),
                    const SizedBox(
                      height:20,
                    ),
                    ElevatedButton(onPressed: (){
                      homeViewModel.refreshApi();
                    }, child: const Text('Retry'))

                  ],
                ),
              );
            }
            else
              {
                return  Center(child: Text(homeViewModel.error.toString()));
              }

          case Status.COMPLETED:
            return  ListView.builder(
                itemCount:homeViewModel.userList.value.data!.length,
                itemBuilder: (context,index){
                  var data=homeViewModel.userList.value.data![index];
              return  ListTile(
                leading:CircleAvatar(
                  radius:25,
                  backgroundImage:NetworkImage(data.avatar.toString()),
                ),
                title:Text(data.firstName.toString()),
                subtitle:Text(data.email.toString()),
              );
            });
        }
      })
    );
  }
}
