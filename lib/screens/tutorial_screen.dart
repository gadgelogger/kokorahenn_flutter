// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_overboard/flutter_overboard.dart';

class TutorialScreen extends StatelessWidget {
  TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        skipCallback: () {
          // when user select SKIP
          Navigator.pop(context);
        },
        finishCallback: () {
          // when user select NEXT
          Navigator.pop(context);
        },
      ),
    );
  }

  final pages = [
    PageModel(
      color: const Color(0xFFf19a38),
      imageAssetPath: 'assets/images/splash_icon.png',
      title: 'ここらへん',
      body: 'ここらへんは、あなたの周りにあるレストランを探すアプリです',
      doAnimateImage: true,
    ),
    PageModel(
      color: const Color.fromARGB(255, 90, 198, 115),
      imageAssetPath: 'assets/images/splash_icon.png',
      title: 'アップデートでより便利に',
      body: '将来的にレストラン以外の施設も検索できるようになる予定です',
      doAnimateImage: true,
    ),
    PageModel.withChild(
      child: const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          'さあ、ご飯を食べに行こう！',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      color: const Color(0xFF5886d6),
      doAnimateChild: true,
    ),
  ];
}
