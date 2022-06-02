import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    print(data['products']);
    return data['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            var data = await readJson();
            // save data to database
          },
          child: const Text(
            'Load Data',
            style: TextStyle(color: Colors.white, fontSize: 28.0),
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
