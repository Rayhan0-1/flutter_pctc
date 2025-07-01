import 'package:flutter/material.dart';
import 'productController.dart';
class restApiUIDesign extends StatefulWidget {
  const restApiUIDesign({super.key});

  @override
  State<restApiUIDesign> createState() => _restApiUIDesignState();
}

class _restApiUIDesignState extends State<restApiUIDesign> {

  final productController product_Controller = productController();

  void productDialog() {
    TextEditingController productNameController = TextEditingController();
    // TextEditingController productCodeController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productQtyController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Add product'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: productNameController,
                    decoration: InputDecoration(labelText: 'product name'),
                  ),
                  TextField(
                    controller: productImageController,
                    decoration: InputDecoration(labelText: 'product Image'),
                  ),
                  TextField(
                    controller: productQtyController,
                    decoration: InputDecoration(labelText: 'product Qty'),
                  ),
                  TextField(
                    controller: productUnitPriceController,
                    decoration: InputDecoration(
                        labelText: 'product unit price'),
                  ),
                  TextField(
                    controller: productTotalPriceController,
                    decoration: InputDecoration(labelText: 'Total price'),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: ()=>
                          Navigator.pop(context),
                          child: Text('Close')),
                      SizedBox(width: 10),
                      ElevatedButton(onPressed: (){
                        product_Controller.createProducts(productNameController.text, productImageController.text, int.parse(productQtyController.text) , int.parse(productUnitPriceController.text), int.parse(productTotalPriceController.text));
                        fetchData();
                        Navigator.pop(context);
                      }, child: Text('Add product'),),
                    ],
                  )
                ],
              ),
            ));
  }

  Future<void>fetchData()async {
    await product_Controller.fetchProducts();
     print(product_Controller.products.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
          itemCount: product_Controller.products.length,
          itemBuilder: (context, index) {
            var product = product_Controller.products[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                // leading: Image.network(product['Img'],
                //      width: 150, fit: BoxFit.contain,),
                title: Text(
                  product['ProductName'], style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('price: \$${product['UnitPrice']}| Qty: ${product['Qty']}', style: TextStyle(),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: ()=> productDialog(), icon: Icon(Icons.edit)),
                    SizedBox(width: 10,),
                    IconButton(onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.red,))
                  ],
                ),
              ),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: Icon(Icons.add),),
    );
  }
}



