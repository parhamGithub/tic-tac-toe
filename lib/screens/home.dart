import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/buttons.dart';
import 'package:tic_tac_toe/widgets/scors.dart';

import 'package:tic_tac_toe/widgets/layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> rooms = [];
    for (var i = 0; i < 3; i++) {
      rooms.add(
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('c1 r1'),
            Text('c1 r2'),
            Text('c1 r3'),
          ],
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 3, 7, 77),
            Color.fromARGB(255, 9, 1, 29),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Scors(),
            SizedBox(height: 80),
            Layout(),
            SizedBox(height: 80),
            Buttons(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
