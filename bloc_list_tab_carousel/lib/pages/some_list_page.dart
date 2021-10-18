import 'package:flutter/material.dart';

class SomeListPage extends StatelessWidget {
  const SomeListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List<String>.generate(20, (i) => 'Item $i');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
