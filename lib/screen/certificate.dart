import 'package:flutter/material.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(size: 25),
        title: const Text(
          "Certificate ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),

      ),

      body: SingleChildScrollView(
        child: Container(
          height: 200,
          width: double.infinity,
          color: Colors.red,
        ),
      ),
    );
  }
}

