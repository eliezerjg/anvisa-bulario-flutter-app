
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/RequestClientSE.dart';
import 'DetailProductVW.dart';

class HomePageVW extends StatefulWidget {
  @override
  _HomePageVWState createState() => _HomePageVWState();
}

class _HomePageVWState extends State<HomePageVW> {
  String searchText = "";
  final TextEditingController _controller =
  TextEditingController(text: "Consulta - Medicamentos Anvisa");
  List produtos = [];

  void _performSearch(String value) {
    RequestClient.getProducts(value).then((resultados) => {
      setState(() {
        searchText = value;
        produtos.clear();
        if (!resultados[0].contains("Error")) {
          produtos.addAll(resultados);
        }
      })
    });
  }

  void getScreenDados(String produto) {
    RequestClient.getFirstItemFromListOfProducts(produto).then((processo) => {
      RequestClient.getDetailOfProduct(processo)
          .then(
                  (dadosMedicamento) => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DetailProductVW(dadosMedicamento)),
                  )})
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: AnimatedSearchBar(
            label: "Search Something Here",
            controller: _controller,
            labelStyle: TextStyle(fontSize: 16),
            searchStyle: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            searchDecoration: const InputDecoration(
              hintText: "Search",
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print("value on Change");
              setState(() {
                searchText = value;
              });
            },
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AnimatedSearchBar(
                label: "Digite algo aqui para pesquisar...",
                onChanged: (value) {
                  _performSearch(value);
                },
              ),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: produtos.length,
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    String produto = produtos[index];
                    return ListTile(
                        title: Text(produto),
                        leading: Icon(Icons.medical_information),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {
                            getScreenDados(produto);
                          },
                        ));
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
