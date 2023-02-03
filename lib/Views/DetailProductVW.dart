
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:untitled/DTOs/ProdutoDetailDTO.dart';



class DetailProductVW extends StatefulWidget {
  ProdutoDetailDTO? _detail;

  DetailProductVW(ProdutoDetailDTO detail){
    this._detail = detail;
  }

  @override
  _DetailProductVWState createState() => _DetailProductVWState(_detail!);
}

class _DetailProductVWState extends State<DetailProductVW> {
  ProdutoDetailDTO? _detail;
  Map? produtos;
  _DetailProductVWState(ProdutoDetailDTO detail){
    _detail = detail;
    if(detail != null){
      produtos = _detail?.toMap();
    }
  }




  final TextEditingController _controller = TextEditingController(text: "Consulta - Medicamentos Anvisa");


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes medicamento'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                flex:2,
                child: ListView.separated(
                  itemCount: produtos?.length != null ? produtos?.length as int : 0,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    dynamic valor = produtos?.entries.toList()[index].value;
                    dynamic chave = produtos?.entries.toList()[index].key;

                    if(valor is String){
                      String vl = valor as String;
                      valor = valor.substring(0, vl.length > 10 ? 10 : vl.length) + "(...)";
                    }

                    return ListTile(
                        title: Text('$chave: ', style: TextStyle(fontSize: 14)),
                        trailing: Text('$valor', style: TextStyle(fontSize: 12)),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}