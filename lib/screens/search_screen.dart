// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/widgets/search/loading_indicator.dart';

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
  List<Shop> _shops = [];
  bool _isLoading = true;
  final searchPage = t.mainScreen;
  @override
  void initState() {
    super.initState();
    _fetchShopList();
  }

  Future<void> _fetchShopList() async {
    setState(() {
      _isLoading = true;
    });
    final shops = await ApiService().fetchShopList(range: _selectedRange);
    setState(() {
      _shops = shops;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchPage.title),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : SearchList(
              shops: _shops,
              onRefresh: _fetchShopList,
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RangeSelectorModal().show(context, (selectedRange) {
            setState(() {
              _selectedRange = selectedRange;
            });
            _fetchShopList();
          });
        },
        label: Text(
          _selectedRange == 1
              ? '300m'
              : _selectedRange == 2
                  ? '500m'
                  : _selectedRange == 3
                      ? '1km'
                      : _selectedRange == 4
                          ? '2km'
                          : _selectedRange == 5
                              ? '3km'
                              : 'Unknown',
        ),
        icon: const Icon(Icons.sort),
      ),
    );
  }
}
