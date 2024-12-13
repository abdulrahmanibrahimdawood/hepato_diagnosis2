import 'package:flutter/material.dart';
import 'package:hepato/constant.dart';

class CustomAnalysisTextFormFeild extends StatefulWidget {
  const CustomAnalysisTextFormFeild(
      {super.key, this.color = kPrimaryColor, required this.data});
  final Color? color;
  final String data;

  @override
  State<CustomAnalysisTextFormFeild> createState() =>
      _CustomAnalysisTextFormFeildState();
}

class _CustomAnalysisTextFormFeildState
    extends State<CustomAnalysisTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Text(
            widget.data,
            style: TextStyle(
              fontSize: 15,
              color: widget.color ?? kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 40,
            width: 90,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
