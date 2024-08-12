import 'dart:async';

import 'package:do_app/ui/main_screens/pages/home_screen.dart';
import 'package:do_app/ui/main_screens/pages/paiements_sreen.dart';
import 'package:do_app/ui/main_screens/profil/profil_screen.dart';
import 'package:do_app/util/constants.dart';
import 'package:flutter/material.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({super.key});

  @override
  State<FirstPageScreen> createState() => _FirstPageScreenState();
}

class _FirstPageScreenState extends State<FirstPageScreen> {
  int _selectedIndex = 0;
  int i = 1;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PaiementsScreen(),
    ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void init(){
    setState(() {
        i ++;
      });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      init();
      if(i == 100) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Badge(label: Text(i.toString()), child: const Icon(Icons.payment)),
            label: 'Paiements',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constant.mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}