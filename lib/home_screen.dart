import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      body: SafeArea(
        child: Column(
          children: [
            // Bagian saldo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rp 325.550.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Saldo tersedia',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _IconWithLabel(icon: Icons.send, label: 'Kirim'),
                      _IconWithLabel(icon: Icons.add_circle_outline, label: 'Isi Ulang'),
                      _IconWithLabel(icon: Icons.receipt_long, label: 'Pesan'),
                      _IconWithLabel(icon: Icons.more_horiz, label: 'Lebih'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Riwayat transaksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    'Riwayat Transaksi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat semua'),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _TransactionTile(title: 'Honoraria', subtitle: 'Fiver', amount: 'Rp 200.000'),
                  _TransactionTile(title: 'Kirim', subtitle: 'Shoope', amount: 'Rp 35.000'),
                  _TransactionTile(title: 'Penerima', subtitle: 'Fiver1', amount: '\$100.00'),
                  Divider(),
                  _TransactionTile(title: 'Devon Lane', subtitle: 'Transfer', amount: '+\$1.200', time: '09:23 AM'),
                  _TransactionTile(title: 'Esther Howard', subtitle: 'Transfer', amount: '+\$1.200', time: '09:21 AM'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconWithLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.pink),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String? time;

  const _TransactionTile({
    required this.title,
    required this.subtitle,
    required this.amount,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.grey),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: TextStyle(
              color: amount.contains('+') ? Colors.green : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (time != null)
            Text(
              time!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
