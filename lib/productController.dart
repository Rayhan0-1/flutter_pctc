import 'dart:convert';

import 'package:hello_world/utils/urls.dart';
import 'package:http/http.dart' as http;



class productController{
  List products = [];

  Future<void>fetchProducts() async{
    final response = await http.get(Uri.parse(Urls.readProduct));
    print(response.statusCode);
    if(response.statusCode == 200){
      final data= jsonDecode(response.body);
      products = data['data'];
    }
}

  Future<void>createProducts(String name, String img, int qty, int price, int totalPrice, ) async{
    final response = await http.post(Uri.parse(Urls.createProduct),
    headers: {'Content-Type' : 'application/json'},
      body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": price,
        "TotalPrice": totalPrice,
      })
      );
    print(response.statusCode);
    if(response.statusCode == 201){
      fetchProducts();
    }
  }
}