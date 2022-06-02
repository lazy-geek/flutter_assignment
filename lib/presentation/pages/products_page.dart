import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/product.dart';
import 'package:flutter_assignment/presentation/widgets/product_card.dart';

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
      body: SafeArea(
        minimum: EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
        child: ListView.separated(
          itemCount: widget.products.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 30,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: widget.products[index]);
          },
        ),
      ),
    );
  }
}
