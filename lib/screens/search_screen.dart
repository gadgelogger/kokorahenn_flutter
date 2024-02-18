// search_page.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../api/service/api_service.dart';
import '../model/dto/shop.dart';
import '../widgets/range_selector_modal.dart';
import 'search_detail_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  int _selectedRange = 3;

  Future<List<Shop>> _fetchShopList() async {
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
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100), // 丸みを帯びた角を設定
                  child: Image.network(
                    shop.logoImage ?? '',
                    width: 50, // 幅を指定
                    height: 50, // 高さを指定
                    fit: BoxFit.cover, // アスペクト比を保ったまま、枠に合わせて全体を表示
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<SearchDetailPage>(
                      builder: (context) => SearchDetailPage(shop: shop),
                    ),
                  );
                },
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
            });
          });
        },
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
