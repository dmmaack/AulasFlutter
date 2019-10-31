import 'package:alcoolougasolina/widgets/loading.button.widget.dart';
import 'package:alcoolougasolina/widgets/logo.widget.dart';
import 'package:alcoolougasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'widgets/input.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcoolCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Success(result: "", reset: () {}),
          Input(ctrl: alcoolCtrl, label: "Alcool"),
          Input(ctrl: gasCtrl, label: "Gasolina"),
          LoadingButton(
            busy: true,
            func: () {},
            invert: false,
            text: "CALCULAR",
          ),

          // Componente do Logo (logo.widget.dart)
        ],
      ),
    );
  }
}
