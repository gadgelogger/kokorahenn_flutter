// Flutter imports:
import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/api/service/api_service.dart';
// Project imports:
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/widgets/search/empty_message.dart';
import 'package:kokorahenn_flutter/widgets/search/error_message.dart';
import 'package:kokorahenn_flutter/widgets/search/range_selector_modal.dart';
import 'package:kokorahenn_flutter/widgets/search/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  int _selectedRange = 3;
  final searchPage = t.mainScreen;
  @override
  void initState() {
    super.initState();
    _fetchShopList();
  }

  Future<List<Shop>> _fetchShopList() async {
    return ApiService().fetchShopList(range: _selectedRange);
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
      body: FutureBuilder<List<Shop>>(
        future: _fetchShopList(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return ErrorMessage();
          }
          if (snapshot.data?.isEmpty ?? true) {
            return EmptyMessage();
          }
          if (snapshot.hasError) {
            return ErrorMessage();
          }
          final shops = snapshot.data ?? [];
          return SearchList(
            shops: shops,
            onRefresh: _fetchShopList,
          );
        },
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
