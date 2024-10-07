import 'package:flutter/material.dart';

class ThreeTabsWidget extends StatefulWidget {
  const ThreeTabsWidget({super.key});

  @override
  _ThreeTabsWidgetState createState() => _ThreeTabsWidgetState();
}

class _ThreeTabsWidgetState extends State<ThreeTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container with white background around the tabs
        Container(
          decoration: BoxDecoration(
            color: Colors.white, // White background for all tabs
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: TabItem(
                  title: 'All',
                  isSelected: selectedIndex == 0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: TabItem(
                  title: 'Ongoing',
                  isSelected: selectedIndex == 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: TabItem(
                  title: 'Complete',
                  isSelected: selectedIndex == 2,
                ),
              ),
            ],
          ),
        ),
        // Content based on the selected tab
        // Expanded(
        //   child: Container(
        //     padding: const EdgeInsets.all(16),
        //     child: selectedIndex == 0
        //         ? Center(
        //             child: Text("All Tasks", style: TextStyle(fontSize: 18)))
        //         : selectedIndex == 1
        //             ? Center(
        //                 child: Text("Ongoing Tasks",
        //                     style: TextStyle(fontSize: 18)))
        //             : Center(
        //                 child: Text("Completed Tasks",
        //                     style: TextStyle(fontSize: 18))),
        //   ),
        // ),
      ],
    );
  }
}

// Custom Widget for Tab Item
class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TabItem({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.brown[600] : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.white) : null,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
