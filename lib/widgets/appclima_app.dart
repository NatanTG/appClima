// ignore_for_file: use_key_in_widget_constructors, camel_case_types


import 'package:appclima/widgets/home.dart';
import 'package:flutter/material.dart';

class appclima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppClima',
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}