import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Reset Password",
              style: TextStyle(fontSize: 22.sp, color: Colors.white),
            ),
            SizedBox(
              height: 150.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Enter your registered email",
                          style: TextStyle(
                              fontSize: 22.sp, color: Color(0xff4c505b)),
                        ),
                        Text(
                          "We will send a password reset option to your email.",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFBBBBBB),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 41.w,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12.r)),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                controller:
                                    _loginController.resetEmailController.value,
                                decoration: InputDecoration(
                                  hintText: "enter your email",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFFA0A0A0),
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Container(
                            height: 35,
                            width: 107,
                            child: ElevatedButton(onPressed: () {
                              if (_loginController
                                  .resetEmailController.value.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your email");
                              } else {
                                _loginController.resetPassword(_loginController
                                    .resetEmailController.value.text);
                              }
                            }, child: Obx(() {
                              return _loginController.isLoading.value
                                  ? CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Reset now",
                                      style: TextStyle(fontSize: 16),
                                    );
                            })),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
