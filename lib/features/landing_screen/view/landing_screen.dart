import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/constants/app_icon.dart';
import 'package:bible_puzzle/constants/app_icon_constants.dart';
import 'package:bible_puzzle/constants/spacing.dart';
import 'package:bible_puzzle/core/responsive_helper.dart';
import 'package:bible_puzzle/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LandingScreen extends HookConsumerWidget {
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: context.heightPx,
        width: context.widthPx,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-1.png'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SafeArea(child: Spacing.sizedBoxH_10()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: AppIconConstants.ads),
                  AppIcon(icon: AppIconConstants.setting),
                ],
              ),
            ),
            Spacing.sizedBoxH_30(),
            Image.asset(
              'assets/images/header.png',
              width: context.widthPct(0.75),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  context.router.push(const CategoryScreen());
                },
                child: Image.asset('assets/images/start_button.png')),
            Spacing.sizedBoxH_30(),
            GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/share_button.png')),
            SizedBox(height: context.heightPct(0.11)),
          ],
        ),
      ),
    );
  }
}
