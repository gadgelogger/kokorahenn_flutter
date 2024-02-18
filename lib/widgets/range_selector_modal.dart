// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'range_selector.dart';

class RangeSelectorModal {
  void show(BuildContext context, void Function(int) onRangeSelected) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        // `RangeSelector`ウィジェットを使用
        return RangeSelector(
          onRangeSelected: (selectedRange) {
            Navigator.pop(context); // モーダルを閉じる
            onRangeSelected(selectedRange);
          },
        );
      },
    );
  }
}
