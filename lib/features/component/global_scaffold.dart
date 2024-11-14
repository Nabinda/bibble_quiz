import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/constants/app_icon.dart';
import 'package:bible_puzzle/constants/app_icon_constants.dart';
import 'package:bible_puzzle/constants/spacing.dart';
import 'package:bible_puzzle/core/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalScaffold extends ConsumerWidget {
  const GlobalScaffold({super.key, required this.child, required this.title});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: context.heightPx,
        width: context.widthPx,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-3.png'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SafeArea(child: Spacing.sizedBoxH_10()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.router.maybePop();
                      },
                      child: AppIcon(icon: AppIconConstants.back)),
                ],
              ),
            ),
            Spacing.sizedBoxH_20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFFFD579), width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFE19C08),
                        offset: Offset(0, 6),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: Color(0xFFCC8B00),
                        offset: Offset(1.5, 1.5),
                        blurRadius: 0.5,
                        spreadRadius: -1.5,
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    title,
                    style: const TextStyle(
                        color: Color(0XFF653905),
                        fontSize: 26,
                        shadows: [
                          Shadow(
                            color: Color(0xFFD5D5D5), // Shadow color
                            offset: Offset(0, 2), // Shadow X and Y offset
                            blurRadius: 0, // Shadow blur radius
                          ),
                        ],
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ],
            ),
            Spacing.sizedBoxH_32(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-2.png'),
                        fit: BoxFit.fill)),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
