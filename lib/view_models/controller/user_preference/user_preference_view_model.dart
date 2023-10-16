

import 'package:get/get.dart';
import 'package:mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserPreference extends GetxController{

  Future<bool> saveUser(UserModel responseMOdel)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseMOdel.token.toString());
    sp.setBool('isLogin', responseMOdel.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');
    return UserModel(
      token: token,
      isLogin: isLogin
    );
  }

  Future<bool> removeUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}