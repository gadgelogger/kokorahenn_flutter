// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';

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

  String getRangeText(int range) {
    switch (range) {
      case 1:
        return '300m';
      case 2:
        return '500m';
      case 3:
        return '1km';
      case 4:
        return '2km';
      case 5:
        return '3km';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchPage.title),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
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
        label: Text(getRangeText(_selectedRange)),
        icon: const Icon(Icons.sort),
      ),
    );
  }
}
