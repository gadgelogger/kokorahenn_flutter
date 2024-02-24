// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/screens/search_detail_screen.dart';
import 'package:kokorahenn_flutter/widgets/search/search_tile.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.shops,
    required this.onRefresh,
  });
  final List<Shop> shops;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: shops.length,
        itemBuilder: (BuildContext context, int index) {
          final shop = shops[index];
          return SearchTile(
            shop: shop,
            cardButtonTap: () => Navigator.push(
              context,
              MaterialPageRoute<SearchDetailPage>(
                builder: (context) => SearchDetailPage(shop: shop),
              ),
            ),
          );
        },
      ),
    );
  }
}
