import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_assignment/data/models/product.dart';
import 'package:flutter_assignment/data/services/sqflite_service.dart';
import 'package:flutter_assignment/data/services/userpref_service.dart';
import 'package:flutter_assignment/presentation/pages/products_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  Future<List<Product>> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    print(data['products']);

    List<Product> products = [];
    for (var item in data['products']) {
      products.add(Product.fromJson(item));
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.ubuntu(
            fontSize: 28,
          ),
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : TextButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  bool flag = await UserPrefService.instance.isDataInserted();
                  if (!flag) {
                    List<Product> data = await readJson();
                    await SqfLiteService.instance.addProducts(data);
                    await UserPrefService.instance.setDataInserted(true);
                  }
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsPage(),
                      ));
                },
                child: Text(
                  'Load Data',
                  style: GoogleFonts.ubuntu(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 157, 11, 254),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 157, 11, 254),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
