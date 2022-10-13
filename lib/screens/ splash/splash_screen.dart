import 'package:flutter/material.dart';
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
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Vaizans Online Shopping",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              )),
              SizedBox(
                height: 20.h,
              ),
              const Icon(
                Icons.airplanemode_active,
                color: Colors.white,
                size: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
