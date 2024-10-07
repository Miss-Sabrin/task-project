import 'package:flutter/material.dart';
import 'package:my_project/widgets/add_tasks.dart';
import 'package:my_project/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List for the tasks and events
    final List<Map<String, dynamic>> items = [
      {'title': 'Ongoing', 'icon': Icons.task, 'color': Colors.brown[400]},
      {
        'title': 'In Process',
        'icon': Icons.task_alt,
        'color': Colors.orange[700]
      },
      {'title': 'Complete', 'icon': Icons.event, 'color': Colors.orangeAccent},
      {'title': 'Cancel', 'icon': Icons.event_note, 'color': Colors.redAccent},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: HomeAppBar(), // Custom app bar from HomeAppBar widget
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add Text "Today" at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Today',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          // Expanded ListView.builder inside Column
          Expanded(
            child: ListView.builder(
              itemCount: (items.length / 2)
                  .ceil(), // Calculate rows (half of total items)
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                // Each row contains two items
                final firstItem = items[index * 2];
                final secondItem =
                    index * 2 + 1 < items.length ? items[index * 2 + 1] : null;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First Item in the Row with bottom border
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: firstItem['color'],
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey, // Add grey border
                                width: 1.0, // Thickness of the border
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(firstItem['icon'], color: Colors.white),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                firstItem['title'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16), // Space between two items

                      // Second Item in the Row (if available) with bottom border
                      if (secondItem != null)
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: secondItem['color'],
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey, // Add grey border
                                  width: 1.0, // Thickness of the border
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(secondItem['icon'],
                                        color: Colors.white),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  secondItem['title'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                );
              },
            ),


            
          ),
          // AddTasks at the bottom
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: AddTasks(),
          ),
        ],
      ),
    );
  }
}
