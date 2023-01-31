import 'dart:convert';
import 'dart:io';

class requestClient{


   Future<List> getProducts(String produto)  async {
    var url = 'https://consultas.anvisa.gov.br/api/produto/listaMedicamentoBula/$produto}';
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Guest');
    HttpClientResponse response =  await request.close();
    String reply = await response.transform(utf8.decoder).join();
    return JsonDecoder().convert(reply);
  }

}

