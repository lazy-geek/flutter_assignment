import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/product.dart';
import 'package:flutter_assignment/data/services/sqflite_service.dart';
import 'package:flutter_assignment/presentation/widgets/product_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
          style: GoogleFonts.ubuntu(
            fontSize: 28,
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
        child: FutureBuilder(
          future: SqfLiteService.instance.getAllProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 30,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(product: snapshot.data![index]);
                },
              );
            } else {
              return Center(
                child: Text(
                  "something went wrong",
                  style: GoogleFonts.ubuntu(
                    fontSize: 18,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
