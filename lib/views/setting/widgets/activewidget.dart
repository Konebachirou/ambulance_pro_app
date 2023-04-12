import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActiveWidget extends StatefulWidget {
  final String title;
  bool active;

  ActiveWidget({Key? key, required this.title, required this.active})
      : super(key: key);

  @override
  _ActiveWidgetState createState() => _ActiveWidgetState();
}

class _ActiveWidgetState extends State<ActiveWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                //activeColor: Colors.amber,
                value: widget.active,
                onChanged: (bool val) {
                  setState(() {
                    widget.active = val;
                  });
                },
              ))
        ],
      ),
    );
  }
}
