import 'package:flutter/material.dart';
import '../api/api.dart';
import '../model/dto/shop.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRequest = ShopService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('周りにある施設一覧'),
      ),
      body: FutureBuilder<List<Shop>>(
        future: userRequest.getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(snapshot.data?[index].logo_image ?? ''),
                title: Text(snapshot.data?[index].name ?? ''),
                subtitle: Text(snapshot.data?[index].address ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
