import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/login/login_view.dart';

class Routes{
  
  static appRoutes()=>[
    GetPage(name:RoutesName.splashScreen, page:()=> SplashScreen(),
    transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
    GetPage(name:RoutesName.loginView, page:()=> const LoginView(),
      transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
  ];
}