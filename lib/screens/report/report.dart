import 'package:flutter/material.dart';
import 'package:my_project/widgets/grapg_task.dart';
import 'package:my_project/widgets/report_app_bar.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    // Liiska hawlaha iyo dhacdooyinka
    final List<Map<String, dynamic>> items = [
      {'title': 'Ongoing', 'icon': Icons.task, 'color': Colors.brown[400]},
      {
        'title': 'In Process',
        'icon': Icons.task_alt,
        'color': Colors.orange[700]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: ReportAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Task Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (items.length / 2)
                  .ceil(), // Calculate rows (half of total items)
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                // First and second items in the row
                final firstItem = items[index * 2];
                final secondItem =
                    index * 2 + 1 < items.length ? items[index * 2 + 1] : null;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      // First Item
                      Expanded(
                        child: Container(
                          height: 120,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '15',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  firstItem['title'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              // Halka CustomPaint lagusoo daray si loo sawiro graph
                              SizedBox(height: 16),
                              Expanded(
                                child: Container(
                                  width: 150, // Cabirka saxda ah ee graph-ka
                                  child: CustomPaint(
                                    painter:
                                        ZigzagLinePainter(), // Custom graph painter
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16), // Space between the two items
                      // Second Item (if exists)
                      if (secondItem != null)
                        Expanded(
                          child: Container(
                            height: 120,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '12',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    secondItem['title'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                // Halka CustomPaint lagusoo daray si loo sawiro graph
                                SizedBox(height: 16),
                                Expanded(
                                  child: Container(
                                    width: 150, // Cabirka saxda ah ee graph-ka
                                    child: CustomPaint(
                                      painter:
                                          ZigzagLinePainter(), // Custom graph painter
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          //!qebtan wa qebta graph tasks
          GrapgTask()
        ],
      ),
    );
  }
}

// Custom Painter for the Zigzag Line (Qalqalocsan)
class ZigzagLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white // Set your line color to white (cad)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Start the line from the bottom left of the container
    path.moveTo(0, size.height);

    // Draw a zigzag line
    for (int i = 1; i <= 6; i++) {
      if (i % 2 == 0) {
        // Move up to create the zigzag (qalqalocsan)
        path.lineTo(size.width * i / 6, size.height * 2.5);
      } else {
        // Move down to create the zigzag (qalqalocsan)
        path.lineTo(size.width * i / 6, size.height * 0.5);
      }
    }

    // Draw the line
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless the data changes
  }
}
