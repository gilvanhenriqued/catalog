import 'package:catalog/components/ListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: ListView(
        children: <Widget>[
          ListItem()
        ],
      )
    );
  }
}