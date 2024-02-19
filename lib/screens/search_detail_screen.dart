// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../model/dto/shop.dart';

class SearchDetailPage extends StatelessWidget {
  const SearchDetailPage({super.key, required this.shop});
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name ?? '詳細'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                shop.photo?.pc?.l ?? '',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey[500],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.map_outlined),
                _buildActionButton(Icons.travel_explore_outlined),
                _buildActionButton(Icons.search_outlined),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            _buildInfoRow(
              Icons.map_outlined,
              '住所:',
              shop.address ?? '住所不明',
            ),
            _buildInfoRow(
              Icons.access_time_outlined,
              '営業時間:',
              shop.open ?? '営業時間不明',
            ),
            _buildInfoRow(
              Icons.block,
              '閉業日:',
              shop.close ?? '閉業日不明',
            ),
            _buildInfoRow(
              Icons.category_outlined,
              'ジャンル',
              shop.genre?.name ?? 'ジャンル不明',
            ),
            _buildInfoRow(
              Icons.restaurant_outlined,
              '食べ放題:',
              shop.freeFood ?? '食べ放題不明',
            ),
            _buildInfoRow(
              Icons.sports_bar_outlined,
              '飲み放題:',
              shop.freeDrink ?? '飲み放題不明',
            ),
            _buildInfoRow(
              Icons.air_outlined,
              'コース:',
              shop.course ?? 'コース不明',
            ),
            _buildInfoRow(
              Icons.no_meeting_room_outlined,
              '総席数:',
              shop.capacity.toString(),
            ),
            _buildInfoRow(
              Icons.smoking_rooms_outlined,
              '禁煙:',
              shop.nonSmoking ?? '禁煙不明',
            ),
            _buildInfoRow(
              Icons.payments_outlined,
              '平均予算:',
              shop.budget?.average ?? '平均予算不明',
            ),
            _buildInfoRow(
              Icons.payment_outlined,
              'カード決済:',
              shop.card ?? 'カード決済不明',
            ),
            _buildInfoRow(
              Icons.no_crash_outlined,
              '駐車場:',
              shop.parking ?? '駐車場不明',
            ),
            _buildInfoRow(
              Icons.wheelchair_pickup,
              'バリアフリー:',
              shop.barrierFree ?? 'バリアフリー不明',
            ),
            _buildInfoRow(
              Icons.access_time_outlined,
              'その他設備:',
              shop.otherMemo ?? 'その他設備不明',
            ),
            _buildInfoRow(
              Icons.block,
              '備考:',
              shop.shopDetailMemo ?? '備考不明',
            ),
          ],
        ),
      ),
    );
  }

//アクションボタンを表示するためのウィジェット
  Widget _buildActionButton(IconData icon) {
    return IconButton(
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {},
    );
  }

//住所や営業時間を表示するためのウィジェット
  Widget _buildInfoRow(IconData icon, String info, String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon),
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
