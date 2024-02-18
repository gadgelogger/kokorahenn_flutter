// search_page.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../api/service/api_service.dart';
import '../model/dto/shop.dart';
import '../widgets/range_selector_modal.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  int _selectedRange = 3; // 初期値

  Future<List<Shop>> _fetchShopList() async {
    // ApiServiceまたは適切なAPIクライアントクラスを使用してデータを取得
    // この例では、選択された範囲に基づいてAPIを呼び出します
    return ApiService().fetchShopList(range: _selectedRange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('周りにある施設一覧'),
      ),
      body: FutureBuilder<List<Shop>>(
        future: _fetchShopList(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('データがありません'));
          }
          final shops = snapshot.data!;
          return ListView.builder(
            itemCount: shops.length,
            itemBuilder: (BuildContext context, int index) {
              final shop = shops[index];
              return ListTile(
                leading: Image.network(shop.logoImage ?? ''),
                title: Text(shop.name ?? '名前なし'),
                subtitle: Text(shop.address ?? '住所不明'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RangeSelectorModal().show(context, (selectedRange) {
            setState(() {
              _selectedRange = selectedRange;
              // 選択された範囲で検索を再実行するために状態を更新
            });
          });
        },
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
