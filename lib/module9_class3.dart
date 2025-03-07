import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Module9Class3 extends StatelessWidget {
  const Module9Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 9"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                height: 200,
                width: 200,
                fit: BoxFit.fill,
                "https://plus.unsplash.com/premium_photo-1667126444822-94fb21279436?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        
            Image.asset('asset/FacebookLogo.png'),
        
            Container(
              height: 40.h,
              width: 40.w,
              color: Colors.red,
            ),
            Text("Hello flutter", style: TextStyle(
                fontSize: 24.sp,
                color: Colors.blue
            ),)
          ],
        ),
      ),
    );
  }
}

