import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class WalletDetailPage extends StatefulWidget {
  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Header(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStateTab(context),
          _buildTransactionsTab(),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  // Building the State Tab content
  Widget _buildStateTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Stanje na računu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('\$190,008.03', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text('+8%', style: TextStyle(color: Colors.green, fontSize: 16)),
              SizedBox(width: 8),
              Icon(Icons.flag, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('Skeniraj', Icons.scanner),
              _buildActionButton('Prihod', Icons.add, () => _showPrihodDialog(context)),
              _buildActionButton('Rashod', Icons.remove, () => _showRashodDialog(context)),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Korisnici novčanika', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          // User Avatars
          Row(
            children: const [
              CircleAvatar(child: Icon(Icons.add)),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Finansijsko zdravlje', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTransactionsTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTransactionTile('Transferred', 'Aug 19, 2023', '\$123.00'),
        _buildTransactionTile('Transferred', 'Jul 20, 2023', '\$12.00'),
        _buildTransactionTile('Refund', 'May 08, 2023', '\$234.00'),
        _buildTransactionTile('Refund', 'Feb 29, 2023', '\$15.00'),
        _buildTransactionTile('Transaction', 'Jan 25, 2023', '-\$92.00'),
        _buildTransactionTile('Transaction', 'Jan 16, 2023', '-\$20.00'),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, [VoidCallback? onPressed]) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[100],
        iconColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Widget for individual transaction tiles
  Widget _buildTransactionTile(String type, String date, String amount) {
    return ListTile(
      title: Text(type),
      subtitle: Text(date),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  // Popup for "Novi prihod" (New Income)
  void _showPrihodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildPopupDialog(
          context,
          title: "Novi prihod",
          description: "Opis prihoda",
        );
      },
    );
  }

  // Popup for "Novi rashod" (New Expense)
  void _showRashodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildPopupDialog(
          context,
          title: "Novi rashod",
          description: "Opis rashoda",
        );
      },
    );
  }

  // Common popup dialog builder for "Prihod" and "Rashod"
  Widget _buildPopupDialog(BuildContext context, {required String title, required String description}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Naziv',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Iznos',
            ),
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            items: const [
              DropdownMenuItem(child: Text('Kategorija 1'), value: '1'),
              DropdownMenuItem(child: Text('Kategorija 2'), value: '2'),
            ],
            onChanged: (value) {},
            decoration: const InputDecoration(labelText: 'Kategorija'),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: description,
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          child: const Text("Dodaj"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
