class ProdutoDetailDTO {
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
  Empresa? empresa;


  ProdutoDetailDTO.fromJson(Map<String, dynamic> json) {
    codigoProduto = json['codigoProduto'];
    tipoProduto = json['tipoProduto'];
    dataProduto = json['dataProduto'];
    nomeComercial = json['nomeComercial'];
    classesTerapeuticas = List<String>.from(json['classesTerapeuticas']);
    numeroRegistro = json['numeroRegistro'];
    dataVencimento = json['dataVencimento'];
    mesAnoVencimento = json['mesAnoVencimento'];
    codigoParecerPublico = json['codigoParecerPublico'];
    codigoBulaPaciente = json['codigoBulaPaciente'];
    codigoBulaProfissional = json['codigoBulaProfissional'];
    dataVencimentoRegistro = json['dataVencimentoRegistro'];
    principioAtivo = json['principioAtivo'];
    medicamentoReferencia = json['medicamentoReferencia'];
    categoriaRegulatoria = json['categoriaRegulatoria'];
    classeTerapeutica = json['classeTerapeutica'];
    atc = json['atc'];
    empresa = json['empresa'] != null ? Empresa.fromJson(json['empresa']) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'codigoProduto': codigoProduto,
      'tipoProduto': tipoProduto,
      'dataProduto': dataProduto,
      'nomeComercial': nomeComercial,
      'classesTerapeuticas': classesTerapeuticas,
      'numeroRegistro': numeroRegistro,
      'dataVencimento': dataVencimento,
      'mesAnoVencimento': mesAnoVencimento,
      'codigoParecerPublico': codigoParecerPublico,
      'codigoBulaPaciente': codigoBulaPaciente,
      'codigoBulaProfissional': codigoBulaProfissional,
      'dataVencimentoRegistro': dataVencimentoRegistro,
      'principioAtivo': principioAtivo,
      'medicamentoReferencia': medicamentoReferencia,
      'categoriaRegulatoria': categoriaRegulatoria,
      'classeTerapeutica': classeTerapeutica,
      'atc': atc
    };
  }


}

class Empresa {
  String? cnpj;
  String? razaoSocial;
  String? numeroAutorizacao;

  Empresa({this.cnpj, this.razaoSocial, this.numeroAutorizacao});

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      cnpj: json['cnpj'],
      razaoSocial: json['razaoSocial'],
      numeroAutorizacao: json['numeroAutorizacao'],
    );
  }
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

