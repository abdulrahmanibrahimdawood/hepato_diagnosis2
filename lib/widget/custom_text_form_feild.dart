import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {super.key,
      required this.hintText,
      required this.icon,
      this.color,
      this.obSecureText = false,
      this.onChanged});
  final String hintText;
  final IconData? icon;
  final Color? color;
  Function(String)? onChanged;
  bool? obSecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'feild is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
