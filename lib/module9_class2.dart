import 'dart:ffi';

import 'package:flutter/material.dart';

class Module9 extends StatelessWidget {
  const Module9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module 9"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          //AspectRatio.
          // Container(
          //   child: AspectRatio(
          //       aspectRatio: 16/9,
          //   child: Container(
          //     color: Colors.amber,
          //   ),),
          // ),

          Center(
            child: SizedBox(
              height: 100,
              width: 250,
              child: Container(
                color: Colors.green,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Container(
          //   height: 350,
          //   width: 250,
          //   color: Colors.blue,
          //   child: FractionallySizedBox(
          //     heightFactor: 0.7,
          //     widthFactor: 0.8,
          //     alignment: Alignment.topRight,
          //     child: Container(
          //       color: Colors.green,
          //       child: Center(child: Text("x% of Height & Width"), ),
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 300,
            width: 200,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),

          // Column(
          //   children: [
          //     Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.red,
          //     ),
          //     Expanded(
          //       child: Container(
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ],
          // ),

          SizedBox(height: 10),
          Center(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                 Container(
                   width: 200,
                   height: 200,
                   decoration: BoxDecoration(
                     color: Colors.blue,
                     borderRadius: BorderRadius.circular(20),
                   ),
                 ),
                 Positioned(
                   top: 20,
                   left: 20,
                   child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                                   ),
                 ),
                 Positioned(
                   bottom: 10,
                   right: 10,
                   child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                                   ),
                 ),
              ],
            ),
          )
        ],
      ),
    );
  }
}