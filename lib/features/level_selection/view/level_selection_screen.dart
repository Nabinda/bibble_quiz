import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/features/component/global_scaffold.dart';
import 'package:bible_puzzle/features/level_selection/view/widgets/level_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LevelSelectionScreen extends HookConsumerWidget {
  const LevelSelectionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlobalScaffold(
      title: 'Select Level',
      child: GridView.builder(
        itemCount: 80,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 24.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) => LevelItem(index: index),
      ),
    );
  }
}
