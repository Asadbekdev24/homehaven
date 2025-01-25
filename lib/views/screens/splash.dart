import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';
import 'package:flutter_application_imtihon/views/screens/pageview_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> waitFor() async {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        //SharedPreferences _prefs = await SharedPreferences.getInstance();

        //var firstTimer = _prefs.getBool("isFirstTimer") ?? true;
        //log(firstTimer.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PageViewClass()
              //firstTimer ? OnboardingScreen() : BooksScreen(),
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: waitFor(),
        builder: (context, snapshot) => Container(
          alignment: Alignment.center,
          color: Appcolors.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.homeSvgPath),
              Text(
                "HomeHaven",
                style: TextStyle(color: Colors.white, fontSize: 36.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
