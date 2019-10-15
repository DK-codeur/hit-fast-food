import 'package:flutter/material.dart';
import 'package:hit_fast_food/src/shared/colors.dart';
import 'package:hit_fast_food/src/shared/styles.dart';
// import '../models/cart_provider.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {

  final String id;
  final String productId;
  final String title;
  final int price;
  final int quantity;
  final String image;
  final String isMenu;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title, this.image, this.isMenu,);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete, 
          color: Colors.white,
          size: 33,
        ),
      ),

      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Supprimer ?', style: TextStyle(color: Colors.red)),
            content: Text('Êtes vous sûr de vouloir retirer cet element de votre panier ?'),
            actions: <Widget>[
              Divider(),
              FlatButton(
                child: Text('Annuler', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),

              FlatButton(
                child: Text('Supprimer'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          )
        );
      },


      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 20),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Text(title, style: h6),
                Text('.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(isMenu, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)
              ],
            ),
            subtitle: Column(
              
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Prix U. : ${price.toInt()} F',),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Total : ${(price * quantity).toInt()} F'),
                  ],
                ),
              ],
            ),

            leading:  Container(
                width: 100,
                height: 100,
                child: Image.network(
                  image
                ),
            ),

            trailing: Text('x$quantity'),
          ),
        ),
      ),
    );
  }
}