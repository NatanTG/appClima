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
  late Future<List<PrevisaoHora>> ultimasPrevisoes;

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
        child: FutureBuilder<List<PrevisaoHora>>(
          future: ultimasPrevisoes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PrevisaoHora>? previsoes = snapshot.data;
              double temperaturaAtual = previsoes![0].temperatura;
              double menorTemperatura = double.maxFinite;
              double maiorTemperatura = double.negativeInfinity;
              previsoes?.forEach((obj) {
                if (obj.temperatura < menorTemperatura) {
                  menorTemperatura = obj.temperatura;
                }

                if (obj.temperatura > maiorTemperatura) {
                  maiorTemperatura = obj.temperatura;
                }
              });

              String descricao = previsoes![0].descricao;
              int numeroIcone = previsoes[0].numeroIcone;

              return Column(
                children: [
                  Resumo(
                    cidade: 'Caraguatatuba-SP',
                    temperaturaAtual: temperaturaAtual,
                    temperaturaMaxima: maiorTemperatura,
                    temperaturaMinima: menorTemperatura,
                    descricao: descricao,
                    numeroIcone: numeroIcone,
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  ProximasTemperaturas(
                    previsoes: previsoes.sublist(1, previsoes.length),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar as previsões');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
