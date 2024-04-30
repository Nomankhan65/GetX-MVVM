import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

class Routes{
  
  static appRoutes()=>[
    GetPage(name:RoutesName.splashScreen, page:()=> const SplashScreen(),
    transition:Transition.leftToRight,
      transitionDuration:const Duration(seconds:1),
    ),
  ];
}