import 'package:flutter/material.dart';
import 'package:kokorahenn_flutter/api/api.dart';
import 'package:kokorahenn_flutter/model/dto/shop.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: FreezedUserPage(), //画面遷移をする部分を下のように別のクラスで定義し、それを読み込む
    );
  }
}

class FreezedUserPage extends StatelessWidget {
  const FreezedUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRequest = ShopService();

    return Scaffold(
      body: FutureBuilder<List<Shop>>(
        // ①で作成した関数を実行
        // ※実行が終わったタイミングでbuilderが実行
        future: userRequest.getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          // ①の実行結果(snapshot.data)を、userListの変数に代入

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
