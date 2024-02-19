// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'range_selector.dart';

class RangeSelectorModal {
  void show(BuildContext context, void Function(int) onRangeSelected) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return RangeSelector(
          onRangeSelected: (selectedRange) {
            onRangeSelected(selectedRange);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
