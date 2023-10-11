
import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view/splash_screen.dart';

class AppRoutes{
  static appRoutes () => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade
    ),

    GetPage(
        name: RoutesName.loginView,
        page: () => LoginView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade
    )
  ];
}