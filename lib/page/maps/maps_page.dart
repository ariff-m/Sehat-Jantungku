import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Lokasi Pusat Kesehatan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: false,
      currentIndex: 2,
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
    );
  }
}
