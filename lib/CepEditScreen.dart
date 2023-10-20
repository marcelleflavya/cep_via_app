import 'package:cep_via_app/cep_model.dart';
import 'package:cep_via_app/cep_service.dart';
import 'package:flutter/material.dart';

class CepEditScreen extends StatefulWidget {
  final Cep cep;
  final int index;
  final CepService cepService;

  CepEditScreen(this.cep, this.index, this.cepService);

  @override
  _CepEditScreenState createState() => _CepEditScreenState();
}

class _CepEditScreenState extends State<CepEditScreen> {
  late TextEditingController logradouroController;
  late TextEditingController bairroController;
  late TextEditingController localidadeController;
  late TextEditingController ufController;

  @override
  void initState() {
    super.initState();
    logradouroController = TextEditingController(text: widget.cep.logradouro);
    bairroController = TextEditingController(text: widget.cep.bairro);
    localidadeController = TextEditingController(text: widget.cep.localidade);
    ufController = TextEditingController(text: widget.cep.uf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
                controller: logradouroController,
                decoration: InputDecoration(labelText: 'Logradouro')),
            TextField(
                controller: bairroController,
                decoration: InputDecoration(labelText: 'Bairro')),
            TextField(
                controller: localidadeController,
                decoration: InputDecoration(labelText: 'Localidade')),
            TextField(
                controller: ufController,
                decoration: InputDecoration(labelText: 'UF')),
            ElevatedButton(
              onPressed: () {
                final updatedCep = Cep(
                  cep: widget.cep.cep,
                  logradouro: logradouroController.text,
                  bairro: bairroController.text,
                  localidade: localidadeController.text,
                  uf: ufController.text,
                );
                widget.cepService.updateCep(widget.index, updatedCep);
                Navigator.of(context)
                    .pop(); 
              },
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
