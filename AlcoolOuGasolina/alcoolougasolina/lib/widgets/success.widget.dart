import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading.button.widget.dart';

class Success extends StatelessWidget {
  var result = "";
  Function reset;

  Success({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big ShouldersDisplay Light",
            ),
            textAlign: TextAlign.center,
          ),
          LoadingButton(
            busy: false,
            func: reset,
            invert: true,
            text: "CALCULAR NOVAMENTE",
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
