import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color(0xFFFFF500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 40,
            height: 40,
          ),
          const Row(
            children: [
              Text(
                'SR',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(width: 5),
              Text('|', style: TextStyle(fontSize: 16, color: Colors.black)),
              SizedBox(width: 5),
              Text(
                'EN',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search action
            },
          ),
        ],
      ),
    );
  }
}
