import 'package:flutter/material.dart';
import 'package:mvvm/res/colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key , required this.onPress});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height*0.15,),
          Icon(Icons.cloud_off, color: AppColor.redColor, size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('Internet Exception')),
          ),
          SizedBox(height: height*0.15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: AppColor.primaryColor
              ),
              child: Center(child: Text('Retry')),
            ),
          )
        ],
      ),
    );
  }
}
