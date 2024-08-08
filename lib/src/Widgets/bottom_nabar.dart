import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNabar extends StatefulWidget {
  const BottomNabar({super.key});

  @override
  State<BottomNabar> createState() => _BottomNabarState();
}

class _BottomNabarState extends State<BottomNabar> {
  int _selecteIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 34, 3, 207),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selecteIndex,
        items: const [
          Icon(Icons.home_rounded, size: 30),
          Icon(Icons.phone, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          // setState(() {
          //   index = _selecteIndex;
          // });
        },
      ),
    );
  }
}
