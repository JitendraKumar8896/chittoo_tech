import 'package:chittoo/screen/profile.dart';
import 'package:chittoo/screen/score.dart';
import 'package:flutter/material.dart';

import 'certificate.dart';
import 'chat.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {

  int _selectedIndex = 1;

  List<Widget> widgetOptions = <Widget>[

    const Certificate(),
    const Profile(),
    const Chats(),
    const Scores()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.green,
          //fixedColor: Colors.amber,
          backgroundColor:  Colors.amber,

          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/dash.png',color: Colors.green,
                //icon: Icons.dashboard ,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/dash.png',
                height: 20,

              ),
              label: "Certificate",
            ),


            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/userout.png',color: Colors.green,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/user.png',
                height: 20,
              ),
              label: "Profile",
            ),


            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/chatout.png',color: Colors.green,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/chat.png',
                height: 20,
              ),
              label: "Chats",
            ),


            BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/scoreout.png',color: Colors.green,
                height: 20,
              ),
              icon: Image.asset(
                'assets/images/score.png',
                height: 20,
              ),
              label: "Scores",
            ),



          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}