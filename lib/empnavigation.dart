import 'package:flutter/material.dart';
import 'package:leave_management_app/emphome.dart';
import 'package:leave_management_app/empprofile.dart';
import 'package:leave_management_app/empreport.dart';

class EmpNavigation extends StatefulWidget {
  const EmpNavigation({Key? key}) : super(key: key);

  @override
  State<EmpNavigation> createState() => _EmpNavigationState();
}

class _EmpNavigationState extends State<EmpNavigation> {
  int currentIndex = 0;
  final screens = [
    EmpHome(),
    EmpReport(),
    EmpProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
