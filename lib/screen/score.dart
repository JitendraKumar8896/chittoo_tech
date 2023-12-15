import 'package:flutter/material.dart';

class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(size: 25),
        title: const Text(
          "Score ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 200,
          width: double.infinity,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
