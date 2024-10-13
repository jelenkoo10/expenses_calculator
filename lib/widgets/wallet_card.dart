import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final String description;
  final double balance;
  final VoidCallback onOpenPressed;

  WalletCard({
    required this.title,
    required this.description,
    required this.balance,
    required this.onOpenPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Stanje: \$${balance.toString()}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: onOpenPressed,
              child: Text('Otvori'),
            ),
          ],
        ),
      ),
    );
  }
}
