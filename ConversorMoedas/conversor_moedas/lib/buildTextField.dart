import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildTextField extends StatelessWidget {
  String labelText;
  String prefixText;
  TextEditingController textController = new TextEditingController();
  final Function funcTextChanged;


  BuildTextField({
    @required this.labelText,
    @required this.prefixText,
    @required this.textController,
    @required this.funcTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: funcTextChanged,
      controller: textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder(),
          prefixText: prefixText,
        ),
        style: TextStyle(color: Colors.amber, fontSize: 25));
  }
}
