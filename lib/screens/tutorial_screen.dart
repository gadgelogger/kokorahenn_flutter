import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

class TutorialScreen extends StatelessWidget {
  TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ここでローカル変数としてtutorialを定義
    final tutorial = t.tutorialScreen;

    final pages = [
      PageModel(
        color: const Color(0xFFf19a38),
        imageAssetPath: 'assets/images/splash_icon.png',
        title: tutorial.title,
        body: tutorial.titleDescription,
        doAnimateImage: true,
      ),
      PageModel(
        color: const Color.fromARGB(255, 90, 198, 115),
        imageAssetPath: 'assets/images/splash_icon.png',
        title: tutorial.secondTitle,
        body: tutorial.secondDescription,
        doAnimateImage: true,
      ),
      PageModel.withChild(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Text(
            tutorial.thirdTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true,
      ),
    ];

    return Scaffold(
      body: OverBoard(
        pages: pages,
        skipCallback: () {
          Navigator.pop(context);
        },
        finishCallback: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
