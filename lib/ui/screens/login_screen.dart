
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../widgets/button1.dart';
import '../widgets/input_field.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(428, 926),
            builder: (context, widget) => Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 5.h),
                      Text("  Login\n  into Your Account",
                          style: textTheme.displayLarge),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Image.asset("assets/images/login_pic.png"),
                SizedBox(height: 40.h),
                SizedBox(
                  height: 50.h,
                  width: 390.w,
                  child: const InputField(
                    hint: "Email",
                    label: "Email",
                  ),
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  height: 50.h,
                  width: 390.w,
                  child: InputField(
                    hint: "Password",
                    label: "Password",
                    suffixIcon:
                        TextButton(child: const Text("Show"), onPressed: () {}),
                  ),
                ),
                // const CheckBoxWidget(text: "Remember Me"),
                SizedBox(height: 30.h),
                Container(
                  height: 51.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    // apply shadow to the container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        // shadow on botom and right
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Button1(
                    textStyle: textTheme.labelLarge!,
                    buttonColor: button2Color,
                    text: "Login",
                    borderRadius: 30,
                    onPress: () {
                      // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                    child: Text("Forgot Your Password",
                        style: textTheme.bodyLarge),
                    onPressed: () {
                      // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                    }),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account?", style: textTheme.bodySmall),
                    SizedBox(width: 14.w),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(SignUpScreen.routeName);
                      },
                      child: Text("Sign Up", style: textTheme.labelSmall),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
