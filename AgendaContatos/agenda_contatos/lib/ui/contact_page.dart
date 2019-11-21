import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/helpers/func_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _editedContact;
  FuncHelper _funcHelper = FuncHelper();
  bool _userEdited = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Descartar Alterações?"),
            content: Text(
                "Ao sair da tela as alterações serão perdidas. Deseja continuar?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name ?? "Novo Contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                if (_editedContact.name == null || _editedContact.name.isEmpty)
                  FocusScope.of(context).requestFocus(_nameFocus);
                else if (_editedContact.email == null ||
                    _editedContact.email.isEmpty)
                  FocusScope.of(context).requestFocus(_emailFocus);
                else if (_editedContact.phone == null ||
                    _editedContact.phone.isEmpty)
                  FocusScope.of(context).requestFocus(_phoneFocus);
              } else
                Navigator.pop(context, _editedContact);
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.red),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                      child: Container(
                    width: 140,
                    height: 140,
                    padding: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _funcHelper
                            .getImageProvider(_editedContact.image ?? ""),
                      ),
                    ),
                  )),
                  TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    decoration: InputDecoration(labelText: "Nome"),
                    onChanged: (text) {
                      _userEdited = true;
                      setState(() {
                        _editedContact.name = text;
                      });
                    },
                    validator: (valor) {
                      if (valor.isEmpty) return "Insira o Nome!";
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email"),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact.email = text;
                    },
                    validator: (valor) {
                      if (valor.isEmpty) return "Insira o Email!";
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: "Phone"),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact.phone = text;
                    },
                    validator: (valor) {
                      if (valor.isEmpty) return "Insira o Phone!";
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
