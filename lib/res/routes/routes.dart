import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/home/home_screen.dart';
import '../../view/login/login_view.dart';

class Routes{
  
  static appRoutes()=>[
    GetPage(name:RoutesName.splashScreen, page:()=> SplashScreen(),
    transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
    GetPage(name:RoutesName.loginScreen, page:()=> const LoginScreen(),
      transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
    GetPage(name:RoutesName.homeScreen, page:()=>   HomeScreen(),
      transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
  ];
}