// Flutter imports:
import 'package:flutter/material.dart';

class DetailButtons extends StatelessWidget {
  const DetailButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton.filledTonal(
          icon: const Icon(Icons.map_outlined),
          padding: const EdgeInsets.all(20),
          onPressed: () {},
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.travel_explore_outlined),
          padding: const EdgeInsets.all(20),
          onPressed: () {},
        ),
        IconButton.filledTonal(
          icon: const Icon(Icons.search_outlined),
          padding: const EdgeInsets.all(20),
          onPressed: () {},
        ),
      ],
    );
  }
}
