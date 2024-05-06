import 'package:flutter/material.dart';

class IdentificationPage extends StatelessWidget {
  const IdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Identification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: false,
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_rounded),
            label: 'Identification',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          }
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/identificatonPage');
          }
          if (index == 2) {
            Navigator.pushReplacementNamed(context, '/mapsPage');
          }
        },
      ),
    );
  }
}
