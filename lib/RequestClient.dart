import 'dart:convert';
import 'dart:io';


import 'DTOS/ListOfProductsDTO.dart';

class RequestClient{


  static Future<List<String>> getProducts(String produto) async {
    var url = 'https://consultas.anvisa.gov.br/api/produto/listaMedicamentoBula/$produto';
    HttpClient client = HttpClient();

    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Guest');
    var response = await request.close();

     return response.transform(utf8.decoder).join()
         .then((value) => value.replaceAll("\"", ""))
         .then((value) => value.replaceAll("[", ""))
         .then((value) => value.replaceAll("]", ""))
         .then((value) => value.split(","));


  }


  static Future<String> getFirstItemFromListOfProducts(String nomeProduto) async {
    var url = 'https://consultas.anvisa.gov.br/api/consulta/genericos?count=10&filter[nomeProduto]=$nomeProduto&page=1';
    HttpClient client = HttpClient();

    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Guest');
    request.headers.set('Host', 'consultas.anvisa.gov.br');
    var response = await request.close();

    var responseBody = await response.transform(utf8.decoder).join();
    final body = json.decode(responseBody);

    return body['content'][0]["processo"];
  }


  static Future<String> getDetailOfProduct(String processo) async {
    var url = 'consultas.anvisa.gov.br/api/consulta/medicamento/produtos/$processo';
    HttpClient client = HttpClient();

    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Guest');
    request.headers.set('Host', 'consultas.anvisa.gov.br');
    var response = await request.close();

    var responseBody = await response.transform(utf8.decoder).join();
    final body = json.decode(responseBody);

    return body['principioAtivo'];
  }





}

