import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/features/component/global_scaffold.dart';
import 'package:bible_puzzle/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> categories = [
      "COMFORTING",
      "COURAGE",
      "FAITH–IN–HARD–TIMES",
      "FORGIVENESS",
      "FRIENDSHIP",
      "GOD'S PROMISES",
      "HAPPINESS",
      "HEALING",
      "HOPE",
      "LOVE",
      "MOTIVATIONAL",
      "PEACE",
      "PRAYERS",
      "PROTECTION",
      "THANKFUL",
    ];

    return GlobalScaffold(
        title: 'Choose Bible Category',
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisExtent: 46),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.router.push(const LevelSelectionScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0XFFF8971D),
                  border: Border.all(color: const Color(0XFFF8971D)),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFFCE90),
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    ),
                  ]),
              child: Center(
                child: StrokeText(
                  text: categories[index],
                  strokeColor: const Color(0XFF653905),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 22 / 16,
                      color: Colors.white,
                      shadows: [
                        Shadow(offset: Offset(0, 2), color: Color(0XFF653905))
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
