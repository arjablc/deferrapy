import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.isActive,
    required this.label,
    required this.onPressed,
  });

  final bool isActive;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isActive ? Colors.deepPurple : Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: isActive ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
