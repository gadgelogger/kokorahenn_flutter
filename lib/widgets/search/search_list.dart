// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/screens/search_detail_screen.dart';
import 'package:kokorahenn_flutter/widgets/search/empty_message.dart';
import 'package:kokorahenn_flutter/widgets/search/error_message.dart';
import 'package:kokorahenn_flutter/widgets/search/loading_indicator.dart';
import 'package:kokorahenn_flutter/widgets/search/search_tile.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.shopsFuture});
  final Future<List<Shop>> shopsFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Shop>>(
      future: shopsFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }
        if (snapshot.data?.isEmpty ?? true) {
          return const EmptyMessage();
        }
        if (snapshot.hasError) {
          return const ErrorMessage();
        }

        final shops = snapshot.data!;
        return ListView.builder(
          itemCount: shops.length,
          itemBuilder: (BuildContext context, int index) {
            final shop = shops[index];
            return SearchTile(
              shop: shop,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<SearchDetailPage>(
                  builder: (context) => SearchDetailPage(shop: shop),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
