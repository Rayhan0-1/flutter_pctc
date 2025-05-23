import 'package:flutter/material.dart';
import 'package:water_tracker_app/waterTracker.dart';
import 'package:sizer/sizer.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.red,
            appBarTheme: AppBarTheme(
              color: Colors.red,
              centerTitle: true,
            ),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white))),
        title: 'Ostad Flutter app',
        home: WaterTracker(),
      );
    });
  }
}
