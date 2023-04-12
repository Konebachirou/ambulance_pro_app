import 'package:flutter/material.dart';

Widget circularProgress() {
  return Center(
    child: Stack(
      children: <Widget>[
        const SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 1, 66, 94)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          child: const Text(
            'Loading',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
