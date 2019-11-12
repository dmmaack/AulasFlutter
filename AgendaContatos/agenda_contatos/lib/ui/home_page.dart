import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:agenda_contatos/ui/contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper _helper = ContactHelper();

  List<Contact> listContacts = List();

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.name = "Daniel Maack";
    // c.email = "dmmak@fgkes.com";
    // c.phone = "1209929283874";

    // _helper.saveContact(c);

    // c = Contact();
    // c.name = "Daniel Maack";
    // c.email = "dmmak@fgkes.com";
    // c.phone = "1209929283874";

    //_helper.saveContact(c);

    _helper.getAllContacts().then((list) {
      setState(() {
        listContacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listContacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _showContactPage(contact: listContacts[index]);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: listContacts[index].image != null
                          ? FileImage(File(listContacts[index].image))
                          : AssetImage("images/person.png")),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    listContacts[index].name ?? "",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    listContacts[index].email ?? "",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    listContacts[index].phone ?? "",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //quando o parametro é passado entre chaves {} significa que o parametro é opcional
  void _showContactPage({Contact contact}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );
  }
}
