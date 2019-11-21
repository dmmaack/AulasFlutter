import 'dart:async';

import 'package:bloc_project/pages/dados_cep.dart';
import 'package:dio/dio.dart';

class HomePageBloc {
  final StreamController<String> _streamController = StreamController<String>();

  Sink<String> get input => _streamController.sink;
  Stream<DadosCepModel> get output => _streamController.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _searchCep(cep));

  String url(String cep) => "https://viacep.com.br/ws/$cep/json/";

  Future<DadosCepModel> _searchCep(String cep) async {
    Response response = await Dio().get(url(cep));
    if (response == null) return new DadosCepModel();

    return DadosCepModel.fromJson(response.data);
  }
}
