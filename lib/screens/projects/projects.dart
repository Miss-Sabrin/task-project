import 'package:flutter/material.dart';
import 'package:my_project/widgets/project_app_bar.dart';
import 'package:my_project/widgets/taps.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ProjectAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.grey[100]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ), // Space before the content
              ThreeTabsWidget(), // Tabs widget
              SizedBox(height: 20),
              CustomContainerWidget(title: 'App projects', subTitle: 'hi'),
              SizedBox(height: 10),
              CustomContainerWidget(
                  title: 'Ongoing projects', subTitle: 'hello'),
              SizedBox(height: 10),
              CustomContainerWidget(
                  title: 'Ongoing projects', subTitle: 'hello'),
              SizedBox(height: 10),
              CustomContainerWidget(
                  title: 'Completed projects', subTitle: 'done'),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Container with CircleAvatar
class CustomContainerWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomContainerWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Digital project Design',
                style: TextStyle(color: Colors.grey),
              ),
              Text('Team'),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // CircleAvatars with overlap
                  buildOverlappingAvatars(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Jan 12, 2023',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          //! Right side: Circular progress indicator with text in the center
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          value: 0.65, // 65% progress
                          strokeWidth: 9,
                          backgroundColor:
                              Colors.grey[300], // Background circle color
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green), // Progress color (green)
                        ),
                      ),
                      Text(
                        '65%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '26 Tasks',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
          // End of right column
        ],
      ),
    );
  }

  // Overlapping avatars
  Widget buildOverlappingAvatars() {
    return SizedBox(
      width: 60, // Adjust width to ensure enough space for 3 avatars
      child: Stack(
        clipBehavior: Clip.none, // Allow avatars to overflow and overlap
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
                'https://media.istockphoto.com/id/1815745180/photo/portrait-of-beautiful-multiracial-tourist-woman-during-sunset-on-top-of-hill.webp?a=1&b=1&s=612x612&w=0&k=20&c=SDt3m8BFs88Olzf_Ak_yA42qHmsPVp_oPg1s_Ad7GdY='),
          ),
          Positioned(
            left: 20, // Adjust this to control the overlap
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1303206630/photo/portrait-of-smiling-caucasian-businesswoman-pose-in-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=vXQ6jnbUYRi4qn4GzRGJKDBH3PAezENQzM6b5_6FImI='),
            ),
          ),
          Positioned(
            left: 40, // Adjust this to control the overlap
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          Positioned(
            left: 60, // Adjust this to control the overlap
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.amber[700],
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                '+',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
