import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/core/responsive_helper.dart';
import 'package:bible_puzzle/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleNav() {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          context.router.replaceAll([const LandingScreen()]);
        }
      });
    }

    useMemoized(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        handleNav();
      });
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
              child: Image.asset(
            'assets/logo/logo.png',
            width: context.widthPct(0.4),
          )),
          const Positioned(
              bottom: 50, child: CircularProgressIndicator.adaptive())
        ],
      ),
    );
  }
}
