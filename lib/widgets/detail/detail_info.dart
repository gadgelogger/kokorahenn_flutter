import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo(
      {super.key, required this.icon, required this.info, required this.text});
  final IconData icon;
  final String info;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(info),
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
