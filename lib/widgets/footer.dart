import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        width: double.infinity, // Ensures the footer takes up full width
        color: const Color(0xFF333333), // Dark gray background
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.home, color: Color(0xFFFFFF00)),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(
                      'Početna strana',
                      style: TextStyle(color: Color(0xFFFFFF00)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.calendar_today, color: Colors.white),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(
                      'Kalendar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.receipt, color: Colors.white),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(
                      'Novčanici',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.person, color: Colors.white),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(
                      'Profil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
