
import 'package:flutter/material.dart';

import 'questionPage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(size: 25),
        title: const Text(
          "Profile ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // signOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/astr.jpg')),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                  "Please go through the Question and give the answer to win Certificate!",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.red)),
              const SizedBox(
                height: 40,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Questions_Page()));
                    },
                    child: const Text("Win Certificate",
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
