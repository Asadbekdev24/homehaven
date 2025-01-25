import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/viewmodels/providers/provider.dart';
import 'package:flutter_application_imtihon/viewmodels/repositories/repositories.dart';
import 'package:flutter_application_imtihon/views/screens/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: ChangeNotifierProvider(
        create: (context) => ProviderEd(repositoriesEd: RepositoriesEd()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
         home: SplashScreen(),
        ),
      ),
    );
  }
}