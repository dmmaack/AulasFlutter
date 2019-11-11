import 'package:api_giphy/pages/ui/home-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Buscador de Gifs',
      theme: ThemeData(
        hintColor: Colors.white,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      home: HomePage(),
    ));
