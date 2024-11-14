import 'package:flutter/material.dart';

class GameLevelWidget extends StatelessWidget {
  final int level;
  const GameLevelWidget({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDDDDDD), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFF5E1).withOpacity(0.8),
            offset: const Offset(1.5, 1.5),
            blurRadius: 0.5,
          ),
          const BoxShadow(
            color: Color(0xFF8494A0),
            offset: Offset.zero,
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        'Level - $level',
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 22 / 18,
            letterSpacing: -0.41,
            color: Color(0XFF653905),
            shadows: [Shadow(offset: Offset(0, 2), color: Color(0XFFC9C9C9))]),
      ),
    );
  }
}
