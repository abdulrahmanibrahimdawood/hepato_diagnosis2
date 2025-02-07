import 'package:flutter/material.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/widget/custom_analysis_text_form_feild.dart';
import 'package:hepato/widget/custom_app_bar.dart';
import 'package:hepato/widget/custom_botton_login.dart';
import 'package:hepato/widget/custom_text_diagnosis.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  static String id = kAnalysisPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                text1: "Show Results",
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CustomTextDiagnosis(
                        sufferFrom: 'You should ...',
                        analysis: 'ALT & AST & Total Protien. '),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
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
                    const SizedBox(
                      height: 20,
                    ),

                    const Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "AST",
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        CustomAnalysisTextFormFeild(
                          data: "T Protien",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==============================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom:
                            'IF you suffer from upper abdominal pain :-',
                        analysis: 'Alkaline Phosphataes.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "ALP",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==========================================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from jaundice :-',
                        analysis: 'Direct Bilirubin.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "DBIL",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //==========================================================================================================
                    const CustomTextDiagnosis(
                        sufferFrom: 'IF you suffer from ascites :-',
                        analysis: 'Albumin.'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        CustomAnalysisTextFormFeild(
                          data: "ALB",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButtomLogIn(text: 'Submit', onTap: () {})
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
