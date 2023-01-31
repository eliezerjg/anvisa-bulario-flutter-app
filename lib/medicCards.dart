import 'dart:collection';

import 'package:flutter/material.dart';



class medicCards extends StatefulWidget {

  LinkedHashMap<dynamic, dynamic> _produtos = LinkedHashMap();

  medicCards(LinkedHashMap<dynamic, dynamic> produtos){
    this._produtos = produtos;
  }

  @override
  _MedicCardsState createState() => _MedicCardsState(_produtos);
}

class _MedicCardsState extends State<medicCards> {

  LinkedHashMap<dynamic, dynamic> _produtos = LinkedHashMap();

  _MedicCardsState(LinkedHashMap<dynamic, dynamic> produtos) : super(){
    this._produtos = produtos;
  }




  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _produtos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Center(child: Text('Entry ${_produtos.values.first}')),
          );
        }
    );
  }
}