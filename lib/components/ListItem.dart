import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Arroz'),
      trailing: Icon(Icons.add_shopping_cart),
    );
  }
}