// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../api/api.dart';
import '../model/dto/shop.dart';

import '../services/location_service.dart'; // LocationServiceをインポート

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final userRequest = ShopService();
  final locationService = LocationService();

  Future<List<Shop>>? _shopsFuture;

  @override
  void initState() {
    super.initState();
    _shopsFuture = fetchShops();
  }

  Future<List<Shop>> fetchShops() async {
    final position = await locationService.getCurrentPosition();
    return userRequest.getAllShops(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('周りにある施設一覧'),
      ),
      body: FutureBuilder<List<Shop>>(
        future: _shopsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.hasError) {
            return const Center(child: Text('位置情報を取得できませんでした。'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final shop = snapshot.data![index];
              return ListTile(
                leading: Image.network(shop.logo_image ?? ''),
                title: Text(shop.name ?? ''),
                subtitle: Text(shop.address ?? ''),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _shopsFuture = fetchShops();
          });
        },
        child: const Icon(Icons.sort),
      ),
    );
  }
}
