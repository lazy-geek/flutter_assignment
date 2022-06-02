import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {},
          child: Container(
            alignment: Alignment.center,
            width: 130,
            child: const Text(
              'Load Data',
            ),
          ),
          style: TextButton.styleFrom(
            primary: const Color.fromARGB(255, 157, 11, 254),
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
