// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:appclima/widgets/resumo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Clima'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Resumo(
              cidade: 'Caraguatatuba-SP',
              temperaturaAtual: 33,
              temperaturaMaxima: 39,
              temperaturaMinima: 27,
              descricao: 'Ensolarado',
              numeroIcone: 1,),
          ],
        ),
      ),
    );
  }
}