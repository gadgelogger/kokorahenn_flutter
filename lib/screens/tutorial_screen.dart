// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_overboard/flutter_overboard.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        color: const Color(0xFF5AC673),
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
