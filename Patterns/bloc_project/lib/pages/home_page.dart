import 'package:bloc_project/pages/dados_cep.dart';
import 'package:bloc_project/pages/home_page_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc bloc = new HomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                bloc.input.add(value);
              },
              decoration: InputDecoration(
                  hintText: "Digite seu CEP", border: OutlineInputBorder()),
            ),
            Center(
              child: StreamBuilder<DadosCepModel>(
                stream: bloc.output,
                initialData: DadosCepModel(bairro: "Sem Bairro"),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Text("Erro na consulta ao CEP",
                        style: TextStyle(color: Colors.red));
                  if (!snapshot.hasData || snapshot.data.cep == null)
                    return Text("CEP inexistente",
                        style: TextStyle(color: Colors.red));

                  DadosCepModel model = snapshot.data;
                  return Text("Bairro: ${model.bairro}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
