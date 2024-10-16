import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/wallet_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pretraži...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                WalletCard(
                  title: 'Moj novčanik',
                  subtitle: 'Samo Vi',
                  amount: '246\$',
                  onOpenPressed: () {
                    Navigator.pushNamed(context, '/walletDetail');
                  },
                ),
                WalletCard(
                  title: 'Firma novčanik',
                  subtitle: 'Vi i još 3 osobe',
                  amount: '246\$',
                  onOpenPressed: () {
                    Navigator.pushNamed(context, '/walletDetail');
                  },
                ),
                WalletCard(
                  title: 'Moj novčanik',
                  subtitle: 'Samo Vi',
                  amount: '246\$',
                  onOpenPressed: () {
                    Navigator.pushNamed(context, '/walletDetail');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}