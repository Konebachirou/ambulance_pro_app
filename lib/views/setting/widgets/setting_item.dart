import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          margin: const EdgeInsets.only(top: 2, bottom: 2),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 22,
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(text)),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
