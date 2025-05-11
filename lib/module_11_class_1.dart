import 'package:flutter/material.dart';
import 'package:learning_back/widget/cityWidget.dart';
import 'package:sizer/sizer.dart';

class Module11Class1 extends StatefulWidget {
  const Module11Class1({super.key});

  @override
  State<Module11Class1> createState() => _Module11Class1State();
}

class _Module11Class1State extends State<Module11Class1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure ?"),
            content: Text("Are you sure to delete this?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Module 11"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This is snackbar"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: Text(
                "SnackBar",
                style: TextStyle(fontSize: 25),
              )),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: true,
                    isScrollControlled: false,
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Center(child: Text("This is Bottom Sheet")),
                          Container(
                            width: 100,
                            height: 150,
                            color: Colors.red,
                          )
                        ],
                      );
                    });
              },
              child: Text(
                "Bottom Sheet",
                style: TextStyle(fontSize: 25),
              )),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure ?"),
                        content: Text("Are you sure to delete this?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Okay")),
                        ],
                      );
                    });
              },
              child: Text("Alert Dialog")),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Top Cities",
            style: TextStyle(fontSize: 30),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CityWidget(
                  cityImage: 'https://cutt.ly/Przeq4FP',
                  cityName: 'Dubai',
                  cityDescription:
                      'This is Dubai, The expensive city in the world.',
                ),
                SizedBox(
                  width: 5.w,
                ),
                CityWidget(
                  cityImage: 'https://cutt.ly/Hrzw4UU2',
                  cityName: 'Singapore',
                  cityDescription:
                      'This is Singapore, The beautiful city in the world.',
                ),
                SizedBox(
                  width: 5.w,
                ),
                CityWidget(
                  cityImage: 'https://cutt.ly/mrzw71Mt',
                  cityName: 'China',
                  cityDescription:
                      'This is China, The city of Innovation in the world.',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
