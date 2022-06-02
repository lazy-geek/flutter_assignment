import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/product.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  const ProductsPage({Key? key, required this.products}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Text(widget.products[index].productName),
          );
        },
      ),
    );
  }
}
