import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String description;
  final VoidCallback onOpenPressed;

  const WalletCard({
    required this.title,
    required this.subtitle,
    required this.amount,
    this.description = "Dummy description",
    required this.onOpenPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Wallet icon on the left
            Image.asset(
              'assets/images/wallet.png',
              width: 70, // Set appropriate size for the image
              height: 70,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16), // Space between image and text content

            // Text content on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Stanje: {amount.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onOpenPressed,
                    child: const Text('Otvori'),
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
