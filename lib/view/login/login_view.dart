import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/view_models/controller/login_view_model.dart';

import '../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                controller: loginVM.emailController.value,
                focusNode: loginVM.emailFocusNode.value,
                validator: (value){
                  if(value!.isEmpty){
                    Utils.snackBar('Email', 'Enter Email');
                  }
                },
                  onFieldSubmitted: (value){
                  Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
                  },
                decoration: InputDecoration(hintText: 'Enter Email',
                    border: OutlineInputBorder()),
          ),
                SizedBox(height: 20,),
                TextFormField(
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
                ),
              ],
            ),
          ),

          SizedBox(height: 40,),
          RoundButton(title: 'Login', onPress: (){
            if(_formKey.currentState!.validate()){

            }
          }, width: 80)
        ],),
      ),
    );
  }
}
