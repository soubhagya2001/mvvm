import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_models/controller/login/login_view_model.dart';
class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('password', 'Enter password');
        }
      },
      onFieldSubmitted: (value){

      },
      decoration: InputDecoration(hintText: 'Enter Password',
          border: OutlineInputBorder()),
    );
  }
}
