import 'package:flutter/material.dart';
import 'productController.dart';

class restApiUIDesign extends StatefulWidget {
  const restApiUIDesign({super.key});

  @override
  State<restApiUIDesign> createState() => _restApiUIDesignState();
}

class _restApiUIDesignState extends State<restApiUIDesign> {
  final productController product_Controller = productController();

  void productDialog({String ? id, String ? name, String ? qty, String ? img, int ? unitPrice, int ? totalPrice}) {


    TextEditingController productNameController = TextEditingController();
    // TextEditingController productCodeController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productQtyController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    productNameController.text = name ?? '';
    productQtyController.text = qty.toString() ?? '';
    productImageController.text = img ?? '';
    productUnitPriceController.text = unitPrice.toString() ?? '';
    productTotalPriceController.text = totalPrice.toString() ?? '';

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(id == null ? 'Add product' : 'Update product'),
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
                    decoration:
                        InputDecoration(labelText: 'product unit price'),
                  ),
                  TextField(
                    controller: productTotalPriceController,
                    decoration: InputDecoration(labelText: 'Total price'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close')),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                            if(id == null){
                              product_Controller.createProducts(
                                  productNameController.text,
                                  productImageController.text,
                                  int.parse(productQtyController.text),
                                  int.parse(productUnitPriceController.text),
                                  int.parse(productTotalPriceController.text));
                            }
                            else{
                              product_Controller.updateProducts(id,
                                  productNameController.text,
                                  productImageController.text,
                                  int.parse(productQtyController.text),
                                  int.parse(productUnitPriceController.text),
                                  int.parse(productTotalPriceController.text));
                            }

                          fetchData();
                          Navigator.pop(context);
                          setState(() {

                          });
                        },
                        child: Text(id == null ? 'Add product' : 'Update product'),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Future<void> fetchData() async {
    await product_Controller.fetchProducts();
    print(product_Controller.products.length);
    setState(() {

    });
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
                  product.productName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'price: \$${product.unitPrice}| Qty: ${product.qty}',
                  style: TextStyle(),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => productDialog(
                          id: product.sId,
                          name: product.productName,
                          img: product.img,
                          qty: product.qty.toString(),
                          unitPrice: product.unitPrice,
                          totalPrice: product.totalPrice,
                        ),
                        icon: Icon(Icons.edit)),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          product_Controller.deleteProducts(product.sId.toString()).then((value){
                            if(value){
                              setState(() {
                                fetchData();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Product deleted'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Something wrong, try again'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
