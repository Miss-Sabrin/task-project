import 'package:flutter/material.dart';

class ReportAppBar extends StatelessWidget {
  const ReportAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.arrow_back),
            SizedBox(
              width: 10,
            ),
            Text(
              'Report',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.date_range),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.menu_sharp)
          ],
        ),
      ],
    );
  }
}
