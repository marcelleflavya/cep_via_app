import 'package:cep_via_app/cep_model.dart';
import 'package:cep_via_app/cep_service.dart';
import 'package:flutter/material.dart';

class CepListScreen extends StatelessWidget {
  final List<Cep> ceps;
  final CepService cepService;

  CepListScreen(this.ceps, this.cepService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de CEPs'),
      ),
      body: ListView.builder(
        itemCount: ceps.length,
        itemBuilder: (context, index) {
          final cep = ceps[index];
          return ListTile(
            title: Text(cep.cep),
            subtitle: Text(cep.localidade),
            onTap: () {
              //tela de ediçao
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                cepService.deleteCep(index);
                Navigator.of(context).pop(); //
              },
            ),
          );
        },
      ),
    );
  }
}
