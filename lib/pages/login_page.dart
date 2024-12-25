import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/helper/show_snak_bar.dart';
import 'package:hepato/widget/custom_botton_login.dart';
import 'package:hepato/widget/custom_inkwell_login.dart';
import 'package:hepato/widget/custom_row_divider.dart';
import 'package:hepato/widget/custom_row_icons_login.dart';
import 'package:hepato/widget/custom_text_form_feild.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static String id = kLogInPage;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? email;

  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: kPrimaryColor),
                  height: 230.h,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Image.asset('assets/splash.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomInkWellLogIn(
                                text: 'Log in',
                                borderColor: kPrimaryColor,
                              ),
                              CustomInkWellLogIn(
                                onTap: () {
                                  Navigator.pushNamed(context, kRegister);
                                },
                                text: 'Register',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextFormFeild(
                          onChanged: (data) {
                            email = data;
                          },
                          icon: Icons.email,
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormFeild(
                          obSecureText: true,
                          onChanged: (data) {
                            password = data;
                          },
                          icon: Icons.lock,
                          hintText: 'Password',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password !",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButtomLogIn(
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await signIn();
                                showSnakBar(context, 'success');
                                Navigator.pushNamed(context, kCustomNavBar);
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'user-not-found') {
                                  showSnakBar(
                                      context, 'No user found for that email.');
                                } else if (ex.code == 'wrong-password') {
                                  showSnakBar(context,
                                      'Wrong password provided for that user.');
                                } else {
                                  showSnakBar(context,
                                      'Authentication error: ${ex.message}');
                                }
                              } catch (ex) {
                                print('Unexpected error: $ex');
                                showSnakBar(
                                    context, 'An unexpected error occurred.');
                              }
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          text: 'Log in',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const CustomRowDivider(
                          text: 'Or Log in with',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const RowIconsLogIn(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
