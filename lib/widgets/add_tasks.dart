import 'package:flutter/material.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 380,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'All Task',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              ],
            ),
            // The first ListTile
            Expanded(
              child: ListView(
                children: [
                  buildListTile(
                      'Dashboard Design',
                      Colors.blue,
                      'https://media.istockphoto.com/id/1407759041/photo/confident-happy-beautiful-hispanic-student-girl-indoor-head-shot-portrait.webp?a=1&b=1&s=612x612&w=0&k=20&c=YpJGPU3av2GChHRWNG2bkcVM6cg9tEI_HZOErFr6GmU=',
                      1.0),
                  buildListTile(
                      'User Research',
                      Colors.green,
                      'https://media.istockphoto.com/id/1815745180/photo/portrait-of-beautiful-multiracial-tourist-woman-during-sunset-on-top-of-hill.webp?a=1&b=1&s=612x612&w=0&k=20&c=SDt3m8BFs88Olzf_Ak_yA42qHmsPVp_oPg1s_Ad7GdY=',
                      0.5),
                  buildListTile(
                      'Wireframe Creation',
                      Colors.red,
                      'https://media.istockphoto.com/id/1303206630/photo/portrait-of-smiling-caucasian-businesswoman-pose-in-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=vXQ6jnbUYRi4qn4GzRGJKDBH3PAezENQzM6b5_6FImI=',
                      0.75),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build ListTile widget for each item
  Widget buildListTile(
      String title, Color iconColor, String imageUrl, double progressValue) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 10), // Optional margin
      child: ListTile(
        leading: Icon(
          Icons.task_alt, // Left-side icon
          color: iconColor,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progressValue, // Adjust progress here
              color: Colors.orange, // Progress bar color
              backgroundColor:
                  Colors.grey[300], // Background color of progress bar
            ),
            SizedBox(height: 10),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(imageUrl), // First image
            ),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(imageUrl), // Second image
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(Icons.arrow_forward_sharp, color: Colors.grey),
            ) // Arrow forward icon
          ],
        ),
      ),
    );
  }
}
