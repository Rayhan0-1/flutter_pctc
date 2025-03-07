import 'package:app7/module9_class2.dart';
import 'package:app7/module9_class3.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'myApp.dart';


void main() {
  runApp(DevicePreview(
      builder: (context) => myApp(),
  ));
}