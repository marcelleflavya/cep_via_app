import 'package:cep_via_app/CepListScreen.dart';
import 'package:cep_via_app/cep_model.dart';
import 'package:cep_via_app/cep_service.dart';
import 'package:flutter/material.dart';

class CepScreen extends StatefulWidget {
  @override
  _CepScreenState createState() => _CepScreenState();
}

class _CepScreenState extends State<CepScreen> {
  final CepService cepService = CepService();
  final TextEditingController cepController = TextEditingController();
  Cep? currentCep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta e Cadastro de CEPs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: cepController,
              decoration: InputDecoration(labelText: 'CEP'),
            ),
            ElevatedButton(
              onPressed: () async {
                final cep = await cepService.fetchCep(cepController.text);
                setState(() {
                  currentCep = cep;
                });
              },
              child: Text('Consultar CEP'),
            ),
            if (currentCep != null) Text('CEP consultado: ${currentCep!.cep}'),
            ElevatedButton(
              onPressed: () {
                if (currentCep != null) {
                  cepService.addCep(currentCep!);
                  setState(() {
                    currentCep = null;
                  });
                }
              },
              child: Text('Cadastrar CEP'),
            ),
            ElevatedButton(
              onPressed: () {
                final ceps = cepService.getCeps();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CepListScreen(ceps, cepService),
                ));
              },
              child: Text('Listar CEPs'),
            ),
          ],
        ),
      ),
    );
  }
}
