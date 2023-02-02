class ProductDTO{
  String? nomeProduto;
  String? processo;
  String? registro;
  String? razaoSocial;
  String? cnpj;
  String? situacao;
  String? dataVencimento;
  String? codigoTipo;
  String? descSituacao;
  String? descTipo;

  ProductDTO({
     this.nomeProduto,
     this.processo,
     this.registro,
     this.razaoSocial,
     this.cnpj,
     this.situacao,
     this.dataVencimento,
     this.codigoTipo,
     this.descSituacao,
     this.descTipo,
  });

  ProductDTO.fromJson(Map<String, dynamic> json) {
    nomeProduto = json['nomeProduto'];
    processo = json['processo'];
    registro = json['registro'];
    razaoSocial = json['razaoSocial'];
    cnpj = json['cnpj'];
    situacao = json['situacao'];
    dataVencimento = json['dataVencimento'];
    codigoTipo = json['codigoTipo'];
    descSituacao = json['descSituacao'];
    descTipo = json['descTipo'];
  }
}