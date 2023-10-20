import 'package:cep_via_app/cepScreem.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de CEPs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CepScreen(),
    );
  }
}
