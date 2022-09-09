// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:appclima/widgets/home.dart';
import 'package:flutter/material.dart';

import '../controllers/tema_controller.dart';

class appclima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: TemaController.instance,
        builder: (context, child) {
          return MaterialApp(
            title: 'AppClima',
            theme: TemaController.instance.usarTemaEscuro
                ? ThemeData.dark()
                : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
  }
}
