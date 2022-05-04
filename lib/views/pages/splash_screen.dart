import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/const/app_colors.dart';
import 'package:flutter_ecommerce/controllers/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.splashTimer();
    return Scaffold(
      backgroundColor: AppColors.DEEP_ORANGE,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text("Welcome to Vaizans",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 44.sp),)),
              SizedBox(height: 20.h,),
              CircularProgressIndicator(color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}
