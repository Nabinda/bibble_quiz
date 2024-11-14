// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:bible_puzzle/features/category_screen/view/category_screen.dart'
    as _i1;
import 'package:bible_puzzle/features/game_screen/view/game_screen.dart' as _i2;
import 'package:bible_puzzle/features/landing_screen/view/landing_screen.dart'
    as _i3;
import 'package:bible_puzzle/features/level_selection/view/level_selection_screen.dart'
    as _i4;
import 'package:bible_puzzle/features/splash_screen/view/splash_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.CategoryScreen]
class CategoryScreen extends _i6.PageRouteInfo<void> {
  const CategoryScreen({List<_i6.PageRouteInfo>? children})
      : super(
          CategoryScreen.name,
          initialChildren: children,
        );

  static const String name = 'CategoryScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategoryScreen();
    },
  );
}

/// generated route for
/// [_i2.GameScreen]
class GameScreen extends _i6.PageRouteInfo<GameScreenArgs> {
  GameScreen({
    _i7.Key? key,
    required int level,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          GameScreen.name,
          args: GameScreenArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'GameScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameScreenArgs>();
      return _i2.GameScreen(
        key: args.key,
        level: args.level,
      );
    },
  );
}

class GameScreenArgs {
  const GameScreenArgs({
    this.key,
    required this.level,
  });

  final _i7.Key? key;

  final int level;

  @override
  String toString() {
    return 'GameScreenArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [_i3.LandingScreen]
class LandingScreen extends _i6.PageRouteInfo<void> {
  const LandingScreen({List<_i6.PageRouteInfo>? children})
      : super(
          LandingScreen.name,
          initialChildren: children,
        );

  static const String name = 'LandingScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LandingScreen();
    },
  );
}

/// generated route for
/// [_i4.LevelSelectionScreen]
class LevelSelectionScreen extends _i6.PageRouteInfo<void> {
  const LevelSelectionScreen({List<_i6.PageRouteInfo>? children})
      : super(
          LevelSelectionScreen.name,
          initialChildren: children,
        );

  static const String name = 'LevelSelectionScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.LevelSelectionScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
