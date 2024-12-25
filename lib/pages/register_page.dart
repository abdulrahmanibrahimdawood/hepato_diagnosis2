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

class Register extends StatefulWidget {
  const Register({super.key});
  static String id = kRegister;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInkWellLogIn(
                                onTap: () {
                                  Navigator.pushNamed(context, kLogInPage);
                                },
                                text: 'Log in',
                              ),
                              const CustomInkWellLogIn(
                                text: 'Register',
                                borderColor: kPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomTextFormFeild(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: 'Email',
                          icon: Icons.email,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormFeild(
                            obSecureText: true,
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: 'Password',
                            icon: Icons.lock),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password !",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CustomButtomLogIn(
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await registerUser();
                                  showSnakBar(context, 'success');
                                  Navigator.pushNamed(context, kCustomNavBar);
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == 'weak-password') {
                                    showSnakBar(context,
                                        'The password provided is too weak.');
                                  } else if (ex.code ==
                                      'email-already-in-use') {
                                    showSnakBar(context,
                                        'The account already exists for that email.');
                                  }
                                } catch (ex) {
                                  print('Unexpected error: $ex');
                                  showSnakBar(
                                      context, 'An unexpected error occurred.');
                                }
                                isLoading = false;
                                setState(() {});
                              } else {}
                            },
                            text: 'Register'),
                        SizedBox(height: 20.h),
                        const CustomRowDivider(
                          text: 'Or Register with',
                        ),
                        SizedBox(height: 20.h),
                        const RowIconsLogIn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
