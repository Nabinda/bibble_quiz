import 'package:bible_puzzle/constants/app_icon.dart';
import 'package:bible_puzzle/constants/app_icon_constants.dart';
import 'package:bible_puzzle/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void showUnlockDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 52),
      child: UnlockDialog(),
    ),
  );
}

class UnlockDialog extends HookConsumerWidget {
  const UnlockDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Unlock Levels',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 18, height: 22 / 18),
              ),
              Spacing.sizedBoxH_14(),
              Text(
                'Finish previous level or Watch Ad to unlock next level.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    height: 14.52 / 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFF333333).withOpacity(0.7)),
              ),
              Spacing.sizedBoxH_14(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: const Color(0XFFF8971D),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Watch',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        height: 14.52 / 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Spacing.sizedBoxH_14(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Go to Previous',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        height: 14.52 / 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF333333).withOpacity(0.7)),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              top: -38,
              right: -38,
              child: AppIcon(icon: AppIconConstants.close))
        ],
      ),
    );
  }
}
