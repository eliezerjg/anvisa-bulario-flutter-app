import 'dart:convert';
import 'dart:io';


import 'package:untitled/DTOs/ProductDetailDTO.dart';


class RequestClient{
  static var authHeaders = {
    'Authorization': 'Guest',
    'Host': 'consultas.anvisa.gov.br'
  };

  static Future<List<String>> getProducts(String produto) async {
    var url = 'https://consultas.anvisa.gov.br/api/produto/listaMedicamentoBula/$produto';
    HttpClient client = HttpClient();

    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    authHeaders.forEach((key, value) => request.headers.add(key, value));

    var response = await request.close();
    var value = await utf8.decodeStream(response);
    value = value.replaceAll("\"", "").replaceAll("[", "").replaceAll("]", "");
    return value.split(",");
  }


  static Future<String> getFirstItemFromListOfProducts(String nomeProduto) async {
    var url = 'https://consultas.anvisa.gov.br/api/consulta/genericos?count=10&filter[nomeProduto]=$nomeProduto&page=1';
    var client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    var request = await client.getUrl(Uri.parse(url));
    authHeaders.forEach((key, value) => request.headers.add(key, value));
    var response = await request.close();
    var responseBody = await utf8.decodeStream(response);
    var body = jsonDecode(responseBody);
    return body['content'][0]["processo"];
  }


  static Future<ProdutoDetailDTO> getDetailOfProduct(String processo) async {
    var url = 'https://consultas.anvisa.gov.br/api/consulta/medicamento/produtos/$processo';
    var client = HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    var request = await client.getUrl(Uri.parse(url));
    authHeaders.forEach((key, value) => request.headers.add(key, value));
    var response = await request.close();
    var responseBody = await utf8.decodeStream(response);
    var body = jsonDecode(responseBody);
    var produto = ProdutoDetailDTO.fromJson(body);
    return produto;
  }





}

