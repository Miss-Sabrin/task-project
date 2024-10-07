import 'package:flutter/material.dart';

class ProjectAppBar extends StatelessWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              'Projects',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.menu)
          ],
        ),
      ],
    );
  }
}
