import 'package:flutter/material.dart';
import 'package:ibadahku/pages/absensi_ibadah.dart';
import 'package:ibadahku/pages/catatan_ibadah.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AbsensiIbadahPage()),
            );
          },
          child: const Text('Absensi Ibadah'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CatatanIbadahPage()),
            );
          },
          child: const Text('Catatan Ibadah'),
        ),
      ],
    );
  }
  
  AbsensiIbadahPage() {}
  
  CatatanIbadahPage() {}
}
