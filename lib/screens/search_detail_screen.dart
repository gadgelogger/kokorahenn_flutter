// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/widgets/detail/detail_buttons.dart';
import 'package:kokorahenn_flutter/widgets/detail/detail_image.dart';
import 'package:kokorahenn_flutter/widgets/detail/detail_info.dart';

class SearchDetailPage extends StatelessWidget {
  SearchDetailPage({super.key, required this.shop});
  final Shop shop;
  final detail = t.restaurantDetailScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shop.name ?? '詳細')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailImage(imageUrl: shop.photo?.pc?.l ?? ''),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            DetailButtons(
              latitude: shop.lat ?? 0,
              longitude: shop.lng ?? 0,
              websiteUrl: shop.urls?.pc ?? '',
              shopName: shop.name ?? '',
            ),
            const SizedBox(height: 20),
            const Divider(),
            DetailInfo(
              icon: Icons.map_outlined,
              info: detail.address,
              text: shop.address ?? '住所不明',
            ),
            DetailInfo(
              icon: Icons.access_time_outlined,
              info: detail.open,
              text: shop.open ?? '営業時間不明',
            ),
            DetailInfo(
              icon: Icons.block_outlined,
              info: detail.close,
              text: shop.close ?? '閉業日不明',
            ),
            DetailInfo(
              icon: Icons.category_outlined,
              info: detail.genre,
              text: shop.genre?.name ?? 'ジャンル不明',
            ),
            DetailInfo(
              icon: Icons.restaurant_rounded,
              info: detail.freeFood,
              text: shop.freeFood ?? '食べ放題不明',
            ),
            DetailInfo(
              icon: Icons.sports_bar_outlined,
              info: detail.freeDrink,
              text: shop.freeDrink ?? '飲み放題不明',
            ),
            DetailInfo(
              icon: Icons.air_outlined,
              info: detail.course,
              text: shop.course ?? 'コース不明',
            ),
            DetailInfo(
              icon: Icons.chair_alt_outlined,
              info: detail.capacity,
              text: shop.capacity.toString(),
            ),
            DetailInfo(
              icon: Icons.smoking_rooms_outlined,
              info: detail.nonSmoking,
              text: shop.nonSmoking ?? '禁煙不明',
            ),
            DetailInfo(
              icon: Icons.payments_outlined,
              info: detail.budget,
              text: shop.budget?.average ?? '平均予算不明',
            ),
            DetailInfo(
              icon: Icons.payment_outlined,
              info: detail.card,
              text: shop.card ?? 'カード決済不明',
            ),
            DetailInfo(
              icon: Icons.no_crash_outlined,
              info: detail.parking,
              text: shop.parking ?? '駐車場不明',
            ),
            DetailInfo(
              icon: Icons.wheelchair_pickup_outlined,
              info: detail.barrierFree,
              text: shop.barrierFree ?? 'バリアフリー不明',
            ),
            DetailInfo(
              icon: Icons.house_outlined,
              info: detail.otherMemo,
              text: shop.otherMemo ?? 'その他設備不明',
            ),
            DetailInfo(
              icon: Icons.note_outlined,
              info: detail.shopDetailMemo,
              text: shop.shopDetailMemo ?? '備考不明',
            ),
          ],
        ),
      ),
    );
  }
}
