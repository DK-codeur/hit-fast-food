import 'package:flutter/material.dart';
import '../datas.dart';

// stores ExpansionPanel state information
class Item {
  Widget expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });
  
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '${categorie[index].name}',
      expandedValue: FlatButton(
        child: Container(
          width: double.infinity,
          child: Text('Click me now')
        ),
        onPressed: () {},
      ),
    );
  });
}

class DrawerCategorie extends StatefulWidget {
  DrawerCategorie({Key key}) : super(key: key);

  @override
  _DrawerCategorieState createState() => _DrawerCategorieState();
}

class _DrawerCategorieState extends State<DrawerCategorie> {
  List<Item> _data = generateItems(categorie.length);

  //funct widget
  Widget _buildPanel() {

    //calllback
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) { 
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: item.expandedValue,
              // subtitle: Text('sous categorie ...'),
              // trailing: Icon(Icons.delete),
          ),

          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  
} //State