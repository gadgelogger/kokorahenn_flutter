import 'package:flutter/material.dart';

import '../../model/dto/shop.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.shop,
    required this.onTap,
  });
  final Shop shop;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          shop.logoImage ?? '',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        shop.name ?? '名前なし',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        shop.address ?? '住所不明',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
