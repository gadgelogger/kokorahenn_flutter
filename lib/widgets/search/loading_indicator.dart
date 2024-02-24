// Flutter imports:
import 'package:flutter/material.dart';

// FIX: 結局1箇所でしか使わないのであれば共通クラスとして切り出す必要性はなく、同じページファイルのprivateクラスorメソッドで十分
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
