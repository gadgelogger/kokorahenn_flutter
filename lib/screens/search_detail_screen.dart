import 'package:flutter/material.dart';
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
        // スクロール可能にする
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 必要なスペースのみを使用
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100), // 角の丸みを調整
              child: Image.network(
                shop.photo?.pc?.l ?? '',
                width: 200, // 幅を調整
                height: 200, // 高さを調整
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20), // 画像とボタンの間隔
            const Divider(),
            const SizedBox(height: 20), // 画像とボタンの間隔

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // ボタン間のスペースを均等に
              children: [
                _buildActionButton(Icons.map_outlined),
                _buildActionButton(Icons.travel_explore_outlined),
                _buildActionButton(Icons.search_outlined),
              ],
            ),
            const SizedBox(height: 20), // ボタンと情報の間隔
            const Divider(),
            _buildInfoRow(Icons.map_outlined, '住所:', shop.address ?? '住所不明'),
            const Divider(),

            _buildInfoRow(
                Icons.access_time_outlined, '営業時間:', shop.open ?? '営業時間不明'),
            const Divider(),

            _buildInfoRow(Icons.block, '閉業日:', shop.close ?? '閉業日不明'),
            const Divider(),

            _buildInfoRow(
                Icons.category_outlined, 'ジャンル', shop.genre?.name ?? 'ジャンル不明'),
            const Divider(),

            _buildInfoRow(
                Icons.restaurant_outlined, '食べ放題:', shop.freeFood ?? '食べ放題不明'),
            const Divider(),

            _buildInfoRow(
                Icons.sports_bar_outlined, '飲み放題:', shop.freeDrink ?? '飲み放題不明'),
            const Divider(),

            _buildInfoRow(Icons.air_outlined, 'コース:', shop.course ?? 'コース不明'),
            const Divider(),

            _buildInfoRow(
              Icons.no_meeting_room_outlined,
              '総席数:',
              shop.capacity.toString(),
            ),
            const Divider(),

            _buildInfoRow(
                Icons.smoking_rooms_outlined, '禁煙:', shop.nonSmoking ?? '禁煙不明'),
            const Divider(),

            _buildInfoRow(Icons.payments_outlined, '平均予算:',
                shop.budget?.average ?? '平均予算不明'),
            const Divider(),

            _buildInfoRow(
                Icons.payment_outlined, 'カード決済:', shop.card ?? 'カード決済不明'),
            const Divider(),

            _buildInfoRow(
                Icons.no_crash_outlined, '駐車場:', shop.parking ?? '駐車場不明'),
            const Divider(),

            _buildInfoRow(Icons.wheelchair_pickup, 'バリアフリー:',
                shop.barrierFree ?? 'バリアフリー不明'),
            const Divider(),

            _buildInfoRow(Icons.access_time_outlined, 'その他設備:',
                shop.otherMemo ?? 'その他設備不明'),
            const Divider(),

            _buildInfoRow(Icons.block, '備考:', shop.shopDetailMemo ?? '備考不明'),
            const Divider(),
          ],
        ),
      ),
    );
  }

//アクションボタンを表示するためのウィジェット
  Widget _buildActionButton(IconData icon) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20), // ボタンの大きさ調整
      ),
      child: Icon(icon),
      onPressed: () {},
    );
  }

//住所や営業時間を表示するためのウィジェット
  Widget _buildInfoRow(IconData icon, String info, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // 行間の調整
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8), // アイコンとテキストの間隔
          Text(info),
          const SizedBox(width: 8), // アイコンとテキストの間隔
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
