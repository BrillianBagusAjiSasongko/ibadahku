import 'package:flutter/material.dart';
import 'package:ibadahku/pages/berandacom/calendar.dart';
import 'package:ibadahku/pages/berandacom/navigation.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: Container(
        color: Colors.grey[200], // Ubah sesuai kebutuhan Anda
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: const Calendar(),
                ),
              ),
            ),
            const NavigationButtons(),
          ],
        ),
      ),
    );
  }
}
