import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/constants/app_icon.dart';
import 'package:bible_puzzle/constants/app_icon_constants.dart';
import 'package:bible_puzzle/core/utils.dart';
import 'package:bible_puzzle/features/level_selection/view/dialogs/unlock_dialog.dart';
import 'package:bible_puzzle/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class LevelItem extends StatelessWidget {
  final int index;

  const LevelItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool completed = index < 5;
    bool currentLevel = index == 5;
    bool isLocked = (!completed && !currentLevel);

    return GestureDetector(
      onTap: () {
        if (isLocked) {
          showUnlockDialog(context);
        } else {
          context.router.push(GameScreen(level: index + 1));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: completed
                    ? const Color(0XFF096C07)
                    : currentLevel
                        ? const Color(0XFF7B4BFA)
                        : const Color(0XFFCF4D0A)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: completed
                    ? const [
                        Color(0XFF4BFA5D),
                        Color(0XFF096C07),
                      ]
                    : currentLevel
                        ? const [
                            Color(0XFF7B4BFA),
                            Color(0XFF3A076C),
                          ]
                        : const [
                            Color(0XFFF8971D),
                            Color(0XFFF8971D),
                          ])),
        child: Center(
          child: isLocked
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AppIcon(icon: AppIconConstants.lock),
                )
              : StrokeText(
                  text: Utils.twoDigit(index + 1),
                  strokeColor: const Color(0XFF653905),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 22 / 16,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(offset: Offset(0, 2), color: Color(0XFF653905))
                      ]),
                ),
        ),
      ),
    );
  }
}
