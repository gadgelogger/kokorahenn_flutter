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
              // FIX: null合体演算子の多言語対応はしない？
              // 多言語対応しました。
              text: shop.address ?? detail.address_error,
            ),
            DetailInfo(
              icon: Icons.access_time_outlined,
              info: detail.open,
              text: shop.open ?? detail.open_error,
            ),
            DetailInfo(
              icon: Icons.block_outlined,
              info: detail.close,
              text: shop.close ?? detail.close_error,
            ),
            DetailInfo(
              icon: Icons.category_outlined,
              info: detail.genre,
              text: shop.genre?.name ?? detail.genre_error,
            ),
            DetailInfo(
              icon: Icons.restaurant_rounded,
              info: detail.freeFood,
              text: shop.freeFood ?? detail.freeFood_error,
            ),
            DetailInfo(
              icon: Icons.sports_bar_outlined,
              info: detail.freeDrink,
              text: shop.freeDrink ?? detail.freeDrink_error,
            ),
            DetailInfo(
              icon: Icons.air_outlined,
              info: detail.course,
              text: shop.course ?? detail.course_error,
            ),
            DetailInfo(
              icon: Icons.chair_alt_outlined,
              info: detail.capacity,
              text: shop.capacity.toString(),
            ),
            DetailInfo(
              icon: Icons.smoking_rooms_outlined,
              info: detail.nonSmoking,
              text: shop.nonSmoking ?? detail.nonSmoking_error,
            ),
            DetailInfo(
              icon: Icons.payments_outlined,
              info: detail.budget,
              text: shop.budget?.average ?? detail.budget_error,
            ),
            DetailInfo(
              icon: Icons.payment_outlined,
              info: detail.card,
              text: shop.card ?? detail.card_error,
            ),
            DetailInfo(
              icon: Icons.no_crash_outlined,
              info: detail.parking,
              text: shop.parking ?? detail.parking_error,
            ),
            DetailInfo(
              icon: Icons.wheelchair_pickup_outlined,
              info: detail.barrierFree,
              text: shop.barrierFree ?? detail.barrierFree_error,
            ),
            DetailInfo(
              icon: Icons.house_outlined,
              info: detail.otherMemo,
              text: shop.otherMemo ?? detail.otherMemo_error,
            ),
            DetailInfo(
              icon: Icons.note_outlined,
              info: detail.shopDetailMemo,
              text: shop.shopDetailMemo ?? detail.shopDetailMemo_error,
            ),
          ],
        ),
      ),
    );
  }
}
