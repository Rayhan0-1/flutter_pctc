import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class restApi extends StatefulWidget {
  const restApi({super.key});

  @override
  State<restApi> createState() => _restApiState();
}

class _restApiState extends State<restApi> {
  List users = [];

  Future<void> fatchUsers() async{

    await Future.delayed(Duration(seconds:2));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      setState(() {
        users = jsonDecode(response.body);
      });
    }
    else{
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    fatchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.isEmpty ? _buildShimmerEffect()
      //     Center(child: CircularProgressIndicator(),)
          :ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Text(user['name'][0], style: TextStyle(color: Colors.white),),
                ),
                title: Text(user['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text('UserName : ${user['username']}', style: TextStyle(color: Colors.grey),),
                    Text('Email : ${user['email']}', style: TextStyle(color: Colors.grey),),
                    Text('Phone : ${user['phone']}', style: TextStyle(color: Colors.grey),),
                    Text('Website : ${user['website']}', style: TextStyle(color: Colors.grey),),
                    Text('Address : ${user['address']['street']}, ${user['address']['city']}', style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget _buildShimmerEffect() {
  return ListView.builder(
    itemCount: 10, // Show 10 items as placeholders
    itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          leading: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 30,
            ),
          ),
          title: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 150,
              color: Colors.white,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 200,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 250,
                  color: Colors.white,
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 12,
                  width: 220,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


