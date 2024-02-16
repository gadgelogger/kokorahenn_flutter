import 'package:flutter/material.dart';

import '../api/api.dart';
import '../model/dto/shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRequest = ShopService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: FutureBuilder<List<Shop>>(
        future: userRequest.getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final shop = snapshot.data?[index];
              if (shop == null) {
                return const ListTile(
                  title: Center(
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              return ListTile(
                leading: Image.network(shop.logo_image ?? ''),
                title: Text(shop.name ?? ''),
                subtitle: Text(shop.address ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
