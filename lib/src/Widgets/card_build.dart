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
    elevation: 6,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
    ),
  );
}
