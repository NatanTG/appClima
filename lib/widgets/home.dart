// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:appclima/services/previsao_service.dart';
import 'package:appclima/widgets/resumo.dart';
import 'package:flutter/material.dart';

import '../models/previsao_hora.dart';
import 'proximas_temperaturas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<PrevisaoHora> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Clima'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Resumo(
              cidade: 'Caraguatatuba-SP',
              temperaturaAtual: 33,
              temperaturaMaxima: 39,
              temperaturaMinima: 27,
              descricao: 'Ensolarado',
              numeroIcone: 1,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ProximasTemperaturas(
              previsoes: ultimasPrevisoes,
            )
          ],
        ),
      ),
    );
  }
}
