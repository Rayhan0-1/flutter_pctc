import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  final List<String> categories = [
    'Fruits',
    'Vegetable',
    'Dairy',
    'Meat',
    'Fish',
    'Bakery',
    'Snacks'
        'Drinks',
    'Frozen'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WrapExample"),
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
                // children:
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(width: 10,),
                // Container(
                //   height: 50,
                //   width: 50,
                //   color: Colors.blueAccent,
                // ),

                spacing: 10,
                runSpacing: 20,
                children: categories.map((category) {
                  return Chip(
                    label: Text(category),
                    backgroundColor: Colors.blueAccent.shade100,
                  );
                }).toList()),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              children: List.generate(
                  100,
                  (index) => Container(
                        color: Colors.blueAccent,
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layout Builder",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, con) {
          if (con.maxWidth > 600) {
            return Center(
              child: Row(children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                SizedBox(height: 10, width: 10),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                SizedBox(height: 10, width: 10),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ]),
            );
            // );
          } else {
            return Center(
              child: Column(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenDemo(name:'Rayhan',)));
                    },
                    child: Text('2nd screen')),
                Text(
                  "This is mobile layout",
                  style: TextStyle(fontSize: 30, color: Colors.amberAccent),
                ),
              ]),
            );
          }
        },
      ),
    );
  }
}

class ScreenDemo extends StatelessWidget {
  final String name;
  const ScreenDemo({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Second Screen"),
        centerTitle: true,
      ),
      body: Center(
        child:
          Text(name),
        ),
    );
  }
}
