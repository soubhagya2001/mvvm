import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/assets/image_assets.dart';
import 'package:mvvm/res/components/internet_exception_widget.dart';
import 'package:mvvm/view_models/services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  void initState(){
    super.initState();
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {

    // return InternetExceptionWidget(onPress: (){});
    return Scaffold(

      appBar: AppBar(
        title: Text('email_hint'.tr),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Image(image: AssetImage(ImageAssets.splashScreen)),
          Text('Splash Screen' , style: TextStyle(fontSize: 15),)
        ],
      ),
        
    );
  }
}
