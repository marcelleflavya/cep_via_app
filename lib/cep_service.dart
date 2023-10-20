import 'package:cep_via_app/cep_model.dart';
import 'package:dio/dio.dart';

class CepService {
  final Dio dio = Dio();
  List<Cep> cepList = [];

  Future<Cep> fetchCep(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        final data = response.data;
        return Cep(
          cep: data['cep'],
          logradouro: data['logradouro'],
          bairro: data['bairro'],
          localidade: data['localidade'],
          uf: data['uf'],
        );
      } else {
        throw Exception('Erro na consulta do CEP');
      }
    } catch (e) {
      throw Exception('Erro na consulta do CEP: $e');
    }
  }

  void addCep(Cep cep) {
    cepList.add(cep);
  }

  void updateCep(int index, Cep cep) {
    cepList[index] = cep;
  }

  void deleteCep(int index) {
    cepList.removeAt(index);
  }

  List<Cep> getCeps() {
    return cepList;
  }
}
