import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/widget/custom_advice_list.dart';
import 'package:hepato/widget/custom_icons_bottom_in_home_page.dart';
import 'package:hepato/widget/custom_image_profile.dart';

class CustomBodyHomePage extends StatelessWidget {
  const CustomBodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconsButtomHomePage(
                  icon: FontAwesomeIcons.bars,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    // CustomImageProfile(
                    //   onTap: () {},
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    'Welcome to ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'HDx app !',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Advice',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const CustomDevicesListView(),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, kAnalysisPage);
                  },
                  child: const Text(
                    'Go to know the result now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
