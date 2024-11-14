import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bible_puzzle/constants/app_icon.dart';
import 'package:bible_puzzle/constants/app_icon_constants.dart';
import 'package:bible_puzzle/constants/spacing.dart';
import 'package:bible_puzzle/core/responsive_helper.dart';
import 'package:bible_puzzle/features/game_screen/view/painters/selection_line_painter.dart';
import 'package:bible_puzzle/features/game_screen/view/widgets/game_level_widget.dart';
import 'package:bible_puzzle/features/game_screen/view/widgets/game_word_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class GameScreen extends StatefulHookConsumerWidget {
  final int level;
  const GameScreen({super.key, required this.level});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  List<String> words = [];
  List<List<String>> grid = [];
  List<String> foundWords = [];
  String currentSelection = "";
  Offset? startPoint, endPoint;
  final double horizontalSpacing = 12;
  final double verticalSpacing = 12;
  List<Offset> selectedIndices = [];
  final Color correctColor = Colors.green;
  Map<Offset, Color> cellColors = {};
  List<Offset> permanentIndices = [];
  List<Offset> permanentLinesStartEnd = [];
  bool showLine = false;
  late ImageProvider bgImage;

  @override
  void initState() {
    super.initState();
    bgImage = const AssetImage('assets/images/game_bg.png');
    initializeLevel();
  }

  void initializeLevel() {
    words = ["LOVE", "HOPE", "WORD", "LOW"];
    grid = [
      ["L", "O", "V", "E", "X", "Y"],
      ["X", "H", "O", "P", "E", "Y"],
      ["A", "B", "W", "O", "R", "D"],
      ["D", "U", "Z", "L", "O", "W"],
      ["B", "G", "L", "W", "N", "A"],
      ["Y", "X", "H", "v", "M", "T"]
    ];
  }

  void startSelection(int row, int col) {
    setState(() {
      selectedIndices = [Offset(row.toDouble(), col.toDouble())];
      currentSelection = grid[row][col];
      startPoint = Offset(col.toDouble(), row.toDouble());
      endPoint = startPoint;
      showLine = true;
      if (!permanentIndices.contains(Offset(row.toDouble(), col.toDouble()))) {
        cellColors.clear();
        cellColors[Offset(row.toDouble(), col.toDouble())] = Colors.blue;
      }
    });
  }

  void updateSelection(int row, int col) {
    row = row.clamp(0, grid.length - 1);
    col = col.clamp(0, grid.length - 1);

    if (startPoint == null) return;

    int startRow = startPoint!.dy.toInt();
    int startCol = startPoint!.dx.toInt();

    int deltaRow = row - startRow;
    int deltaCol = col - startCol;

    if (deltaRow.abs() == deltaCol.abs() || deltaRow == 0 || deltaCol == 0) {
      List<Offset> newSelectedIndices = [];
      String newSelection = "";
      int stepRow = deltaRow.sign;
      int stepCol = deltaCol.sign;
      int r = startRow, c = startCol;

      while (r != row + stepRow || c != col + stepCol) {
        newSelectedIndices.add(Offset(r.toDouble(), c.toDouble()));
        newSelection += grid[r][c];
        r += stepRow;
        c += stepCol;
      }

      setState(() {
        endPoint = Offset(col.toDouble(), row.toDouble());
        selectedIndices = newSelectedIndices;
        currentSelection = newSelection;

        if (!permanentIndices.any((p) => selectedIndices.contains(p))) {
          cellColors.clear();
          for (var pos in newSelectedIndices) {
            cellColors[pos] = Colors.green;
          }
        }
      });
    }
  }

  void endSelection() {
    setState(() {
      if (words.contains(currentSelection) &&
          !foundWords.contains(currentSelection)) {
        foundWords.add(currentSelection);
        for (var pos in selectedIndices) {
          permanentIndices.add(pos);
          cellColors[pos] = correctColor;
        }
        permanentLinesStartEnd.add(startPoint!);
        permanentLinesStartEnd.add(endPoint!);
        showLine = true;

        if (foundWords.length == words.length) {
          _showCompletionDialog();
        }
      } else {
        selectedIndices.clear();
        currentSelection = "";
        cellColors.clear();
        showLine = false;
      }
      startPoint = null;
      endPoint = null;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text(
            'Congratulations!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'You’ve found all the words!',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(true); // Return to level selection
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double cellSize = (context.widthPx - 48) / grid.length;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: bgImage, fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(child: Spacing.sizedBoxH_06()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.router.maybePop();
                      },
                      child: AppIcon(icon: AppIconConstants.back)),
                  GameLevelWidget(level: widget.level),
                  const SizedBox(width: 34)
                ],
              ),
            ),
            Spacing.sizedBoxH_20(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3.7,
                children: words.map((word) {
                  bool isFound = foundWords.contains(word);
                  return GameWordWidget(isFound: isFound, word: word);
                }).toList(),
              ),
            ),
            Spacing.sizedBoxH_40(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onPanStart: (details) {
                        final row =
                            (details.localPosition.dy ~/ cellSize).toInt();
                        final col =
                            (details.localPosition.dx ~/ cellSize).toInt();
                        log("Current Cell Grid : ($row,$col))");
                        startSelection(row, col);
                      },
                      onPanUpdate: (details) {
                        final row =
                            (details.localPosition.dy ~/ cellSize).toInt();
                        final col =
                            (details.localPosition.dx ~/ cellSize).toInt();
                        log("Current Cell Grid : ($row,$col))");
                        if (row >= 0 &&
                            row < grid.length &&
                            col >= 0 &&
                            col < grid.length) {
                          updateSelection(row, col);
                        }
                      },
                      onPanEnd: (_) => endSelection(),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 24,
                            child: CustomPaint(
                              size: Size(
                                  constraints.maxWidth, constraints.maxHeight),
                              painter: SelectionLinePainter(
                                startPoint,
                                endPoint,
                                cellSize,
                                correctColor,
                                showLine,
                                permanentLinesStartEnd,
                              ),
                            ),
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: grid.length,
                              crossAxisSpacing: horizontalSpacing,
                              mainAxisSpacing: verticalSpacing,
                            ),
                            itemCount: grid.length * grid.length,
                            itemBuilder: (context, index) {
                              int row = index ~/ grid.length;
                              int col = index % grid.length;
                              Offset pos =
                                  Offset(row.toDouble(), col.toDouble());
                              Color cellColor = cellColors[pos] ?? Colors.white;
                              if (permanentIndices.contains(pos)) {
                                cellColor = correctColor;
                              }
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: cellColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  grid[row][col],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacing.sizedBoxH_40(),
          ],
        ),
      ),
    );
  }
}
