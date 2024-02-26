// Flutter imports:
import 'package:flutter/material.dart';

class RangeSelector extends StatelessWidget {
  const RangeSelector({super.key, required this.onRangeSelected});
  final void Function(int) onRangeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListTile(title: const Text('300m'), onTap: () => onRangeSelected(1)),
        ListTile(title: const Text('500m'), onTap: () => onRangeSelected(2)),
        ListTile(title: const Text('1km'), onTap: () => onRangeSelected(3)),
        ListTile(title: const Text('2km'), onTap: () => onRangeSelected(4)),
        ListTile(title: const Text('3km'), onTap: () => onRangeSelected(5)),
      ],
    );
  }
}
