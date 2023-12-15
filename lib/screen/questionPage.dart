import 'dart:async';

import 'package:flutter/material.dart';

class Questions_Page extends StatefulWidget {
  const Questions_Page({super.key});

  @override
  State<Questions_Page> createState() => _Questions_PageState();
}

class _Questions_PageState extends State<Questions_Page> {
  Timer? timer;
  int countDown = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  bool read = false;
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          setState(() {
            read = true;
          });
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        iconTheme: const IconThemeData(size: 25),
        title: const Text(
          "Question",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tell me about your self ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(countDown.toString())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                readOnly:read ,
                //controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(fontSize: 20),
                    hintText: "write answer here..",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextButton(
                    onPressed: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Questions_Page()));
                    },
                    child: const Text("Submit",
                        textAlign: TextAlign.center,
                        style:
                            //  height: 2,
                            TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
