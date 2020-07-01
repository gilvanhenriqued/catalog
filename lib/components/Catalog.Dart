import 'package:catalog/models/item.dart';
import 'package:catalog/provider/cartCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  
  _buildList(){
    CartCtrl cartCtrl = Provider.of<CartCtrl>(context);

    return ListView.builder(
      itemCount: cartCtrl.items.length,
      itemBuilder: (context, i) {
        return _buildItems(cartCtrl.items[i]);
      },
    );
  }

  _buildItems(Item item) {
    // CartCtrl cartCtrl = Provider.of<CartCtrl>(context);
    
    return ListTile(
      title: Text("${item.name} por R\$${item.price}"),
      trailing: Icon(Icons.add_shopping_cart),
      onTap: () {
        // add to cart and change the icon
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: Consumer<CartCtrl>(
        builder: (context, cartCtrl, widget) {
          return _buildList(); 
        }
      )
    );
  }
}