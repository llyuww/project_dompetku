import 'package:flutter/material.dart';

class KirimScreen extends StatefulWidget {
  @override
  _KirimScreenState createState() => _KirimScreenState();
}

class _KirimScreenState extends State<KirimScreen> {
  String amount = '5000000'; // default nominal awal

  void _onKeyTap(String value) {
    setState(() {
      if (value == '⌫') {
        if (amount.isNotEmpty) amount = amount.substring(0, amount.length - 1);
      } else {
        amount += value;
      }
    });
  }

  String formatCurrency(String value) {
    if (value.isEmpty) return 'Rp 0';
    var number = int.tryParse(value) ?? 0;
    return 'Rp ${number.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mengirim'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [Icon(Icons.more_vert, color: Colors.black)],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Icon(Icons.person, size: 40),
            SizedBox(height: 5),
            Text('Anlin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('5328-9949-8706-6105', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Text('ATM', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              formatCurrency(amount),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('Bank Republik Indonesia')),
                  Text('•••• 7576'),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            Spacer(),
            buildNumberPad(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // logic untuk transfer di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Isi Ulang'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNumberPad() {
    final buttons = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '.', '0', '⌫',
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: buttons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        final button = buttons[index];
        return InkWell(
          onTap: () => _onKeyTap(button),
          child: Center(
            child: Text(
              button,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
