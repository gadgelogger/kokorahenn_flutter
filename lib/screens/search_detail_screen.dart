// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/widgets/detail/detail_buttons.dart';
import 'package:kokorahenn_flutter/widgets/detail/detail_info.dart';

// Project imports:
import '../model/dto/shop.dart';
import '../widgets/detail/detail_image.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({super.key, required this.shop});
  final Shop shop;

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
            const DetailButtons(),
            const SizedBox(height: 20),
            const Divider(),
            DetailInfo(
              icon: Icons.map_outlined,
              info: '住所:',
              text: shop.address ?? '住所不明',
            ),
            DetailInfo(
              icon: Icons.access_time_outlined,
              info: '営業時間:',
              text: shop.open ?? '営業時間不明',
            ),
            DetailInfo(
              icon: Icons.block_outlined,
              info: '閉業日:',
              text: shop.close ?? '閉業日不明',
            ),
            DetailInfo(
              icon: Icons.category_outlined,
              info: 'ジャンル:',
              text: shop.genre?.name ?? 'ジャンル不明',
            ),
            DetailInfo(
              icon: Icons.restaurant_rounded,
              info: '食べ放題:',
              text: shop.freeFood ?? '食べ放題不明',
            ),
            DetailInfo(
              icon: Icons.sports_bar_outlined,
              info: '飲み放題:',
              text: shop.freeDrink ?? '飲み放題不明',
            ),
            DetailInfo(
              icon: Icons.air_outlined,
              info: 'コース:',
              text: shop.course ?? 'コース不明',
            ),
            DetailInfo(
              icon: Icons.chair_alt_outlined,
              info: '総席数:',
              text: shop.capacity.toString(),
            ),
            DetailInfo(
              icon: Icons.smoking_rooms_outlined,
              info: '禁煙:',
              text: shop.nonSmoking ?? '禁煙不明',
            ),
            DetailInfo(
              icon: Icons.payments_outlined,
              info: '平均予算:',
              text: shop.budget?.average ?? '平均予算不明',
            ),
            DetailInfo(
              icon: Icons.payment_outlined,
              info: 'カード決済:',
              text: shop.card ?? 'カード決済不明',
            ),
            DetailInfo(
              icon: Icons.no_crash_outlined,
              info: '駐車場:',
              text: shop.parking ?? '駐車場不明',
            ),
            DetailInfo(
              icon: Icons.wheelchair_pickup_outlined,
              info: 'バリアフリー:',
              text: shop.barrierFree ?? 'バリアフリー不明',
            ),
            DetailInfo(
              icon: Icons.house_outlined,
              info: 'その他設備:',
              text: shop.otherMemo ?? 'その他設備不明',
            ),
            DetailInfo(
              icon: Icons.note_outlined,
              info: '備考:',
              text: shop.shopDetailMemo ?? '備考不明',
            ),
          ],
        ),
      ),
    );
  }
}
