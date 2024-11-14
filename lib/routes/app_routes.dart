import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreen.page, initial: true),
        AutoRoute(page: LandingScreen.page),
        AutoRoute(page: CategoryScreen.page),
        AutoRoute(page: LevelSelectionScreen.page),
        AutoRoute(page: GameScreen.page),
      ];
}
