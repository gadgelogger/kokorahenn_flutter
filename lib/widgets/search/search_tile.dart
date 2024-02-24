// Package imports:
import 'package:expansion_tile_card/expansion_tile_card.dart'; // import_sorter:keep
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokorahenn_flutter/api/service/location_notifier.dart';
import 'package:kokorahenn_flutter/api/service/location_service.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';

class SearchTile extends ConsumerWidget {
  SearchTile({
    super.key,
    required this.shop,
    required this.cardButtonTap,
  });
  final Shop shop;
  final VoidCallback cardButtonTap;
  final buttonText = t.mainScreen.button;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationNotifier = ref.watch(locationNotifierProvider);
    final userPosition = locationNotifier.currentUserPosition;
    final distance = calculateDistance(
      userPosition?.latitude ?? 0,
      userPosition?.longitude ?? 0,
      shop.lat ?? 0,
      shop.lng ?? 0,
    );
    final distanceText = '$distance先にあります.';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpansionTileCard(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Stack(
            children: [
              Image.network(
                shop.logoImage ?? '',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ],
          ),
        ),
        title: Text(
          shop.name ?? '名前なし',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          distanceText,
        ),
        children: <Widget>[
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _ShopDetailRow(
                  icon: Icons.navigation_outlined,
                  text: shop.address ?? '住所不明',
                ),
                const SizedBox(height: 8),
                _ShopDetailRow(
                  icon: Icons.access_time_outlined,
                  text: shop.open ?? '営業時間不明',
                ),
                const SizedBox(height: 8),
                _ShopDetailRow(
                  icon: Icons.block_outlined,
                  text: shop.close ?? '閉業日不明',
                ),
                const SizedBox(height: 8),
                _ShopDetailRow(
                  icon: Icons.category_outlined,
                  text: shop.genre?.name ?? 'ジャンル不明',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: cardButtonTap,
                      child: Text(buttonText),
                    ),
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

class _ShopDetailRow extends StatelessWidget {
  const _ShopDetailRow({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
