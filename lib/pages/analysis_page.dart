import 'package:flutter/material.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/widget/custom_analysis_text_form_feild.dart';
import 'package:hepato/widget/custom_app_bar.dart';
import 'package:hepato/widget/custom_text_diagnosis.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  static String id = kAnalysisPage;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                text1: "Show Results",
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomTextDiagnosis(
                        sufferFrom:
                            'IF you suffer from upper abdominal pain :-',
                        analysis: 'Alkaline Phosphatase. '),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "Age",
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "Gender",
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "ALT",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "AST",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "ALP",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //==========================================================================================================
                    CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from jaundice :-',
                        analysis: 'Direct Bilirubin.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "ALT",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "AST",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "DBIL",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //==========================================================================================================
                    CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from ascites :-',
                        analysis: 'Albumin.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "ALT",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "AST",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "ALB",
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
