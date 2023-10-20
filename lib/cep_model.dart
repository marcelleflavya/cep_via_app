import 'dart:convert';

class Cep {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  Cep({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  Cep copyWith({
    String? cep,
    String? logradouro,
    String? bairro,
    String? localidade,
    String? uf,
  }) {
    return Cep(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory Cep.fromMap(Map<String, dynamic> map) {
    return Cep(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cep.fromJson(String source) =>
      Cep.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cep(cep: $cep, logradouro: $logradouro, bairro: $bairro, localidade: $localidade, uf: $uf)';
  }

  @override
  bool operator ==(covariant Cep other) {
    if (identical(this, other)) return true;

    return other.cep == cep &&
        other.logradouro == logradouro &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode;
  }
}
