import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/login_controller.dart';
import 'package:flutter_ecommerce/screens/login/reset_password.dart';
import 'package:flutter_ecommerce/screens/signup/registration_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
          _loginController.screenwidth(constraints.maxWidth.toInt());
          print(constraints.maxWidth.toInt());
          print(constraints.minWidth.toInt());
          return Obx(() {
            return _loginController.screenwidth < 460
                ? Column(
                    children: [
                      LebelText(
                          fontsize: 28,
                          height: 150,
                          width: ScreenUtil().screenWidth),
                      Body(layout: 'portrait')
                    ],
                  )
                : SingleChildScrollView(
                    child: Row(
                      children: [
                        LebelText(
                            fontsize: 30,
                            height: ScreenUtil().screenWidth,
                            width: 80),
                        Body(layout: 'horizontal')
                      ],
                    ),
                  );
          });
        })));
  }

  Widget LebelText(
      {required double fontsize,
      required double height,
      required double width}) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.light,
                color: Colors.transparent,
              ),
            ),
            Text(
              "Log In ",
              style: TextStyle(fontSize: fontsize, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget Body({required String layout}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: layout == 'portrait'
                ? BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(28.r),
                    topLeft: Radius.circular(28.r),
                  )),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                layout == 'portrait'
                    ? SizedBox(
                        height: 20.h,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                Text(
                  "Welcome to Vaizans",
                  style: TextStyle(fontSize: 22.sp, color: Color(0xff4c505b)),
                ),
                Text(
                  "Glad to see you.",
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
                        controller: _loginController.emailController.value,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFA0A0A0),
                          ),
                          labelText: 'EMAIL',
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
                  height: 10.h,
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
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 20.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Obx(() {
                        return TextField(
                          controller: _loginController.passwordController.value,
                          obscureText: _loginController.obscureText.value,
                          decoration: InputDecoration(
                            hintText: "password must be 6 character",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFFA0A0A0),
                            ),
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                            ),
                            suffixIcon: _loginController.obscureText == true
                                ? IconButton(
                                    onPressed: () {
                                      _loginController.obscureText(false);
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      size: 20.w,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      _loginController.obscureText(true);
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 20.w,
                                    )),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Wrap(
                  children: [
                    GestureDetector(
                      child: Text(
                        " Forget Password",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        Get.to(ResetPasswordScreen());
                      },
                    )
                  ],
                ),
                layout == 'portrait'
                    ? loginButtonCardPortrait()
                    : loginButtonCardLandscape(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButtonCardPortrait() {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Log In',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4c505b)),
            ),
            CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff4c505b),
                child: Obx(() {
                  return IconButton(
                      color: Colors.white,
                      onPressed: () {
                        _loginController.isLoading == true;
                        _loginController.signIn();
                      },
                      icon: _loginController.isLoading == false
                          ? Icon(Icons.arrow_forward)
                          : CircularProgressIndicator(
                              color: Colors.white,
                            ));
                }))
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Wrap(
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFBBBBBB),
              ),
            ),
            GestureDetector(
              child: Text(
                " Sign Up",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Get.to(RegisterScreen());
              },
            )
          ],
        )
      ],
    );
  }

  Widget loginButtonCardLandscape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFBBBBBB),
              ),
            ),
            GestureDetector(
              child: Text(
                " Sign Up",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Get.to(RegisterScreen());
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Log In',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4c505b)),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff4c505b),
                child: Obx(() {
                  return IconButton(
                      color: Colors.white,
                      onPressed: () {
                        _loginController.isLoading == true;
                        _loginController.signIn();
                      },
                      icon: _loginController.isLoading == false
                          ? Icon(Icons.arrow_forward)
                          : CircularProgressIndicator(
                              color: Colors.white,
                            ));
                }))
          ],
        )
      ],
    );
  }
}
