
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/models/login/user_model.dart';
import 'package:mvvm/repository/login_repository.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

import '../../../utils/utils.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi(){
    loading.value = true;
  Map data = {
    'email' : emailController.value.text,
    'password' : passwordController.value.text
  };

  _api.loginApi(data).then((value){
    loading.value = false;
    if(value['error'] == 'user not found'){
      Utils.snackBar('Login', value['error']);
    }else{
      UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true
      );
      userPreference.saveUser(userModel).then((value){
        Get.delete<LoginViewModel>();
        Get.toNamed(RoutesName.homeView)?.then((value){});
      }).onError((error, stackTrace){

      });
      Utils.snackBar('Login', 'Login successfully');
    }
  }).onError((error, stackTrace){
    print(error.toString());
    loading.value = false;
    Utils.snackBar('Error', error.toString());
  });
  }
}