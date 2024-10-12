import 'package:ecommerce_task/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child:const SplashScreen(),builder: (context, child) {
     return MaterialApp(
        title: 'Flutter ToDo App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: child,
      );
    },);
  }
}