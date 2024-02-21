// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

// Project imports:
import '../api/service/api_service.dart';
import '../model/dto/shop.dart';
import '../widgets/search/range_selector_modal.dart';
import '../widgets/search/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  int _selectedRange = 3;
  final searchPage = t.mainScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchPage.title),
      ),
      body: SearchList(
        shopsFuture: _fetchShopList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RangeSelectorModal().show(context, (selectedRange) {
            setState(() {
              _selectedRange = selectedRange;
            });
            _fetchShopList();
          });
        },
        child: const Icon(Icons.filter_list),
      ),
    );
  }

  Future<List<Shop>> _fetchShopList() async {
    return ApiService().fetchShopList(range: _selectedRange);
  }
}
