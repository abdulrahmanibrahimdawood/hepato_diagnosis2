import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/firebase_options.dart';
import 'package:hepato/pages/analysis_page.dart';
import 'package:hepato/pages/doctors_page.dart';
import 'package:hepato/pages/first_board_page.dart';
import 'package:hepato/pages/home_page.dart';
import 'package:hepato/pages/login_page.dart';
import 'package:hepato/pages/on_board_screen_page.dart';
import 'package:hepato/pages/questions_page.dart';
import 'package:hepato/pages/register_page.dart';
import 'package:hepato/pages/scound_board_page.dart';
import 'package:hepato/pages/third_board_page.dart';
import 'package:hepato/widget/custom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // التأكد من تهيئة WidgetsBinding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Hepato());
}

class Hepato extends StatelessWidget {
  const Hepato({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          routes: {
            kOnBoardScreenState: (context) => const OnBoardScreenState(),
            // kOpenAppPage: (context) => const OpenAppPage(),
            kFirstPage: (context) => const FirstPage(),
            kScoundPage: (context) => const ScoundPage(),
            kThirdPage: (context) => const ThirdPage(),
            kLogInPage: (context) => const LogInPage(),
            kRegister: (context) => Register(),
            kHomePage: (context) => const HomePage(),
            kAnalysisPage: (context) => const AnalysisPage(),
            kQuestionsPage: (context) => const QuesthionsPage(),
            kDoctorsPage: (context) => const DoctorsPage(),
            kCustomNavBar: (context) => const CustomNavBar(),
          },
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            // body: AnalysisPage(),
            body: AnimatedSplashScreen(
              duration: 2000,
              splash: Center(
                child: Transform.scale(
                  scale: 2.5.w,
                  child: Image.asset(
                    'assets/splash.png',
                  ),
                ),
              ),
              nextScreen: const OnBoardScreenState(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
