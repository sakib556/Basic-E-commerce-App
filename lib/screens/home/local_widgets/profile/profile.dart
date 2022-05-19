import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/signup_controller.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final SignupController _signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    _signupController.verifyCheck();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Obx(() {
              return _signupController.isVerified.isTrue
                  ? Text(
                      "Your email is verified.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  : _signupController.isSendEmail.isTrue
                      ? Text(
                          "Email verification option already sent.\nAt first, complete that.Then tap the confirm button.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      : Text(
                          "Verify your email please.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        );
            }),
            Obx(() {
              return _signupController.isVerified.isTrue
                  ? Text(
                      "Verified",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          backgroundColor: Colors.white),
                    )
                  : _signupController.isSendEmail.isTrue
                      ? TextButton(
                          onPressed: () {
                            _signupController.verifyEmail();
                          },
                          child: TextButton(
                            onPressed: () {
                              _signupController.verifyEmail();
                            },
                            child: Text(
                              "Confirm now",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.yellow,
                                  backgroundColor: Colors.blue),
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _signupController.verifyEmail();
                          },
                          child: Text(
                            "Verify now",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                backgroundColor: Colors.white),
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
