import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/helper/show_snak_bar.dart';
import 'package:hepato/services/firebase_autho_services.dart';

class RowIconsLogIn extends StatelessWidget {
  const RowIconsLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerIcons(
            icon: FontAwesomeIcons.google,
            color: Colors.red,
            onPressed: () async {
              print('Google icon pressed');
              try {
                print('Starting Google Sign In');
                final authService = FirebaseAuthoServices();
                await authService.signInWithGoogle();
                print('Google Sign In successful');
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, kCustomNavBar);
              } catch (e) {
                print('Error during Google Sign In: $e');
                // ignore: use_build_context_synchronously
                showSnakBar(
                    context, 'Failed to sign in with Google: ${e.toString()}');
              }
            },
          ),
          // SizedBox(
          //   width: 30.w,
          // ),
          // const ContainerIcons(
          //   icon: FontAwesomeIcons.facebook,
          //   color: Color(0XFF1977F3),
          // ),
          // SizedBox(
          //   width: 30.w,
          // ),
          //
        ],
      ),
    );
  }
}

class ContainerIcons extends StatelessWidget {
  const ContainerIcons({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
  });
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 25.w,
            color: color,
          ),
        ),
      ),
    );
  }
}
