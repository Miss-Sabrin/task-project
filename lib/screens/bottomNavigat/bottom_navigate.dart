import 'package:flutter/material.dart';
import 'package:my_project/screens/home/home.dart';
import 'package:my_project/screens/projects/projects.dart';
import 'package:my_project/screens/report/report.dart';

class BottomNvbar extends StatefulWidget {
  final int initialIndex;

  BottomNvbar({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNvbar> createState() => _BottomNvbarState();
}

class _BottomNvbarState extends State<BottomNvbar> {
  late int currentIndex;

  final List<Widget> screens = [
    HomePage(),
    Projects(),
    Report(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.brown, // Background color
                    shape: BoxShape.circle, // Circular shape
                  ),
                ),
                Icon(Icons.add, color: Colors.white), // Icon in the center
              ],
            ),
            label: 'Report',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
