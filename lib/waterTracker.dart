import 'package:flutter/material.dart';
import 'package:water_tracker_app/widget/addWaterBtn.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int _currentIntake = 0;
  final int _goal = 2000;

  void _waterAdd(int amount){
    setState(() {
      if(_currentIntake < _goal){
        _currentIntake = (_currentIntake + amount).clamp(0, _goal);
        if(_currentIntake == _goal){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Congratulations...!"),
              duration: Duration(seconds: 2),
              action: SnackBarAction(label: 'Undo', onPressed: () {}),
            ),
          );
        }
      }
    });
  }

  void resetWater(){
    setState(() {
      _currentIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIntake / _goal).clamp(0.0 , 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          "Water Tracker",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Column(
                children: [
                  Text("Today's InTake",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${_currentIntake} ml",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade500,
                    color: Colors.blueAccent,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 40,),

            Wrap(
              spacing: 15,
              children: [
                addWaterBtn(amount: 200, icon: Icons.local_drink, onClick: () => _waterAdd(200)),
                addWaterBtn(amount: 500, icon: Icons.water_drop, onClick: () => _waterAdd(500)),
                addWaterBtn(amount: 1000, icon: Icons.local_cafe, onClick: () => _waterAdd(1000)),
              ],
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: ()=> resetWater(),
                    child: Text('Reset', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
