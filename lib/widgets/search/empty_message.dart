// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/gen/assets.gen.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

class EmptyMessage extends StatelessWidget {
  EmptyMessage({super.key});
  final error = t.error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              Assets.images.found.path,
              width: 150,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            error.empty,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
