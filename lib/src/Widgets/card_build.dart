import 'package:flutter/material.dart';

Card buildCard(String title) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: Color.fromARGB(235, 34, 3, 207),
        width: 1,
      ),
    ),
    margin: const EdgeInsets.all(8),
    elevation: 2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_sharp),
              color: const Color.fromARGB(235, 34, 3, 207),
              iconSize: 60,
            ),
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(235, 34, 3, 207),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Card buildNewProcessCard() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: Color.fromARGB(235, 34, 3, 207),
        width: 2,
      ),
    ),
    margin: const EdgeInsets.all(20),
    elevation: 8,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   maquina.add('M0' + (maquina.length + 1).toString());
              // });
            },
            icon: const Icon(
              Icons.add_circle_outline,
              color: Color.fromARGB(235, 34, 3, 207),
              size: 60,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Nuevo Proceso',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(235, 34, 3, 207),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
