// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';

import '../models/previsao_hora.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({super.key, required this.previsoes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Card(
          child: Text('${previsoes[0].temperatura.toStringAsFixed(0)}ºC'),
        ),
        Card(
          child: Text('${previsoes[1].temperatura.toStringAsFixed(0)}ºC'),
        ),
        Card(
          child: Text('${previsoes[2].temperatura.toStringAsFixed(0)}ºC'),
        ),
        Card(
          child: Text('${previsoes[3].temperatura.toStringAsFixed(0)}ºC'),
        ),
      ],
    ));
  }
}
