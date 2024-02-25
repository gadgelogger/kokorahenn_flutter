// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kokorahenn_flutter/api/service/api_service.dart';
import 'package:kokorahenn_flutter/i18n/strings.g.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';
import 'package:kokorahenn_flutter/widgets/search/empty_message.dart';
import 'package:kokorahenn_flutter/widgets/search/error_message.dart';
import 'package:kokorahenn_flutter/widgets/search/range_selector_modal.dart';
import 'package:kokorahenn_flutter/widgets/search/search_list.dart';

class SearchState extends StateNotifier<AsyncValue<List<Shop>>> {
  SearchState() : super(const AsyncValue.loading()) {
    fetchShopList();
  }

  int _selectedRange = 3;

  Future<void> fetchShopList() async {
    state = const AsyncValue.loading();
    try {
      final shops = await ApiService().fetchShopList(range: _selectedRange);
      state = AsyncValue.data(shops);
    } on Exception catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  void setSelectedRange(int range) {
    _selectedRange = range;
    fetchShopList();
  }

  int get selectedRange => _selectedRange;
}

final searchProvider =
    StateNotifierProvider<SearchState, AsyncValue<List<Shop>>>(
  (ref) => SearchState(),
);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    final searchPage = t.mainScreen;
    return Scaffold(
      appBar: AppBar(
        title: Text(searchPage.title),
      ),
      body: searchState.when(
        data: (shops) {
          if (shops.isEmpty) {
            return EmptyMessage();
          } else {
            return SearchList(
              shops: shops,
              onRefresh: () =>
                  ref.read(searchProvider.notifier).fetchShopList(),
            );
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorMessage(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          RangeSelectorModal().show(context, (selectedRange) {
            ref.read(searchProvider.notifier).setSelectedRange(selectedRange);
          });
        },
        label:
            Text(getRangeText(ref.read(searchProvider.notifier).selectedRange)),
        icon: const Icon(Icons.sort),
      ),
    );
  }
}
