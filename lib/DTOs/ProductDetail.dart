class ProdutoDetail {
  int? codigoProduto;
  int? tipoProduto;
  String? dataProduto;
  String? nomeComercial;
  List<String>? classesTerapeuticas;
  String? numeroRegistro;
  String? dataVencimento;
  String? mesAnoVencimento;
  int? codigoParecerPublico;
  String? codigoBulaPaciente;
  String? codigoBulaProfissional;
  String? dataVencimentoRegistro;
  String? principioAtivo;
  String? medicamentoReferencia;
  String? categoriaRegulatoria;
  String? classeTerapeutica;
  String? atc;
  List<ProcessoMedidaCautelar>? processosMedidaCautelar;
  Empresa? empresa;
  Processo? processo;
  List<Apresentacao>? apresentacoes;
}

class Empresa {
  String? cnpj;
  String? razaoSocial;
  String? numeroAutorizacao;
}

class ProcessoMedidaCautelar {

}

class Processo {
  String? numero;
  int? situacao;
}

class Apresentacao {
  int? codigo;
  String? apresentacao;
  List<String>? formasFarmaceuticas;
  int? numero;
  int? tonalidade;
  String? dataPublicacao;
  String? validade;
  int? tipoValidade;
  String? registro;
  List<String>? principiosAtivos;
  String? complemento;
  EmbalagemPrimaria? embalagemPrimaria;
  EmbalagemSecundaria? embalagemSecundaria;
  List<EmbalagemSecundaria>? embalagemSecundariaTodas;
  List<Envoltorio>? envoltorios;
  List<Acessorio>? acessorios;
  Acondicionamento? acondicionamento;
  List<Marca>? marcas;
  List<FabricanteNacional>? fabricantesNacionais;
  List<FabricanteEstrangeiro>? fabricantesEstrangeiros;
}

class EmbalagemPrimaria {
  String? tipo;
  String? observacao;
}

class EmbalagemSecundaria {
  String? tipo;
  String? observacao;
}

class Envoltorio {
  // ...
}

class Acessorio {
  // ...
}

class Acondicionamento {
  // ...
}

class Marca {
  // ...
}

class FabricanteNacional {
  String? fabricante;
  String? cnpj;
  String? pais;
}

class FabricanteEstrangeiro{
}

