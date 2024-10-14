import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/footer.dart';

class WalletDetailPage extends StatefulWidget {
  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Header(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStateTab(),
          _buildTransactionsTab(),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }

  // Building the State Tab content
  Widget _buildStateTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Stanje na računu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('\$190,008.03', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              Text('+8%', style: TextStyle(color: Colors.green, fontSize: 16)),
              SizedBox(width: 8),
              Icon(Icons.flag, color: Colors.blue),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton('Skeniraj', Icons.scanner),
              _buildActionButton('Prihod', Icons.add),
              _buildActionButton('Rashod', Icons.remove),
            ],
          ),
          SizedBox(height: 32),
          Text('Korisnici novčanika', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          // User Avatars
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.add)),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/user.png')),
              SizedBox(width: 8),
              CircleAvatar(backgroundImage: AssetImage('assets/user.png')),
            ],
          ),
          SizedBox(height: 32),
          Text('Finansijsko zdravlje', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Image.asset('assets/financial_chart.png', height: 120),
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

  Widget _buildActionButton(String label, IconData icon, [VoidCallback onPressed]) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        primary: Colors.purple[100],
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Widget for individual transaction tiles
  Widget _buildTransactionTile(String type, String date, String amount) {
    return ListTile(
      // leading: Image.asset(iconPath, height: 40),
      title: Text(type),
      subtitle: Text(date),
      trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
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
  Widget _buildPopupDialog(BuildContext context, {String title, String description}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Naziv',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Iznos',
            ),
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            items: [
              DropdownMenuItem(child: Text('Kategorija 1'), value: '1'),
              DropdownMenuItem(child: Text('Kategorija 2'), value: '2'),
            ],
            onChanged: (value) {},
            decoration: InputDecoration(labelText: 'Kategorija'),
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
          style: ElevatedButton.styleFrom(primary: Colors.yellow),
          child: Text("Dodaj"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
