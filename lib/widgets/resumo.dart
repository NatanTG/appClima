// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Resumo extends StatelessWidget {
  
  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  const Resumo({super.key, required this.cidade, required this.descricao, required this.temperaturaAtual, required this.temperaturaMaxima, required this.temperaturaMinima, required this.numeroIcone,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Icon(Icons.brightness_6_outlined),
                Switch(value: false,
                 onChanged: (valor){},
              )
              ],
            )
          ],
        ),   
        Text(
          cidade,
          style: const TextStyle(fontSize: 18),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/$numeroIcone.png')),
            const Padding(padding: EdgeInsets.all(2)),
            Text(
              '${temperaturaAtual.toStringAsFixed(0)} ºC',
            style: const TextStyle(fontSize: 40),
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${temperaturaMaxima.toStringAsFixed(0)} ºC'),
                Text('${temperaturaMinima.toStringAsFixed(0)} ºC'),
              ],
            )
          ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text(
          descricao,
          style: const TextStyle(fontSize:16),
        )
      ],
    );
  }
}