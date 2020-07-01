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
    CartCtrl cartCtrl = Provider.of<CartCtrl>(context);

    return ListTile(
      title: Text("${item.name} por R\$${item.price}"),
      trailing: cartCtrl.selectedItems.contains(item) ? 
        Icon(Icons.verified_user, color: Colors.green)
        : Icon(Icons.add_shopping_cart),
      onTap: () {
        cartCtrl.add(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        leading: Consumer<CartCtrl>(
          builder: (context, cartCtrl, widget) {
            return Center(
              child: Text(
                "R\$${cartCtrl.total}",
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ); 
          }  
        ),
      ),
      body: Consumer<CartCtrl>(
        builder: (context, cartCtrl, widget) {
          return _buildList(); 
        }
      )
    );
  }
}