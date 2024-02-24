// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/widgets/search/range_selector.dart';

// Project imports:

class RangeSelectorModal {
  void show(BuildContext context, void Function(int) onRangeSelected) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('検索範囲を変更', style: TextStyle(fontSize: 20)),
                RangeSelector(
                  onRangeSelected: (selectedRange) {
                    onRangeSelected(selectedRange);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
