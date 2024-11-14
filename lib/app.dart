import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'routes/app_routes.dart';

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: router.config(),
        title: 'Bible Puzzle',
        theme: ThemeData(fontFamily: 'wonder-boys'),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return OKToast(
            child: LoaderOverlay(
              overlayWidgetBuilder: (progress) {
                return SpinKitFadingCube();
              },
              child: ScrollConfiguration(
                  behavior: GlobalScrollBehavior(),
                  child: ResponsiveBreakpoints.builder(
                    breakpoints: [
                      const Breakpoint(start: 0, end: 768, name: MOBILE),
                      const Breakpoint(start: 769, end: 1024, name: TABLET),
                      const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                      const Breakpoint(
                          start: 1921, end: double.infinity, name: '4K'),
                    ],
                    child:
                        LayoutBuilder(builder: (builderContext, constraints) {
                      return ResponsiveScaledBox(
                          width: ResponsiveValue<double>(builderContext,
                              defaultValue: constraints.maxWidth,
                              conditionalValues: const [
                                Condition.equals(name: MOBILE, value: 414),
                                Condition.equals(name: TABLET, value: 800),
                                Condition.largerThan(name: TABLET, value: 1300),
                              ]).value,
                          child: child!);
                    }),
                  )),
            ),
          );
        });
  }
}
