import 'package:flutter/material.dart';

import 'package:kokorahenn_flutter/api/api.dart';
import 'package:kokorahenn_flutter/model/shop.dart';

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
        home: FreezedUserPage() //画面遷移をする部分を下のように別のクラスで定義し、それを読み込む
        );
  }
}

class FreezedUserPage extends StatelessWidget {
  const FreezedUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRequest = ShopService();
    List<Shop> userList = <Shop>[];

    return Scaffold(
      body: FutureBuilder<List<Shop>>(
        // ①で作成した関数を実行
        // ※実行が終わったタイミングでbuilderが実行
        future: userRequest.getAllShops(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          // ①の実行結果(snapshot.data)を、userListの変数に代入
          userList = snapshot.data ?? <Shop>[];
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(userList[index].logo_image ?? ''),
                title: Text(userList[index].name ?? ''),
                subtitle: Text(userList[index].address ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
