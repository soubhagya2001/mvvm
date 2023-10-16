
import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices{

  UserPreference userPreference = UserPreference();
  void isLogin(){


    userPreference.getUser().then((value){
      if(value.isLogin == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 3), ()=>Get.toNamed(RoutesName.loginView));
      }else{
        Timer(const Duration(seconds: 3), ()=>Get.toNamed(RoutesName.homeView));
      }
    });

  }
}