import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: const Color(0xFF333333), // Dark gray background
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.home, color: Color(0xFFFFFF00)),
                Text(
                  'Početna strana',
                  style: TextStyle(color: Color(0xFFFFFF00)),
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.calendar_today, color: Colors.white),
                Text(
                  'Kalendar',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.receipt, color: Colors.white),
                Text(
                  'Novčanici',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.person, color: Colors.white),
                Text(
                  'Profil',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
