// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:expansion_tile_card/expansion_tile_card.dart';

// Project imports:
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpansionTileCard(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            shop.logoImage ?? '',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
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
        children: <Widget>[
          const Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        shop.open ?? '営業時間不明',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.block_outlined),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        shop.close ?? '閉業日不明',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.category_outlined),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        shop.genre?.name ?? 'ジャンル不明',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: onTap, child: const Text('お店の詳細を見る')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
