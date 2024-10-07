import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              'jun 20, 2020',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.date_range)
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
