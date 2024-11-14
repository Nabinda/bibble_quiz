import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameWordWidget extends StatelessWidget {
  final String word;
  final bool isFound;
  const GameWordWidget({super.key, required this.isFound, required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: isFound ? const Color(0XFF1EFF34) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0XFF8CAFC2)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                color: isFound
                    ? const Color(0XFF1EFF34).withOpacity(0.5)
                    : Colors.white.withOpacity(0.5))
          ]),
      child: Center(
        child: Text(word,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 22 / 16,
                color: const Color(0XFF333333))),
      ),
    );
  }
}
