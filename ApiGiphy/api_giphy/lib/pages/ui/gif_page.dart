import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  final Map _gifData;

  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 90,
                  child: Text(
                    _gifData["title"],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: IconButton(
                    color: Colors.blue,
                    icon: Icon(Icons.share, color: Colors.white),
                    onPressed: () {
                      Share.share(_gifData["images"]["fixed_height"]["url"]);
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 100,
                child: Container(
                  child:
                      Image.network(_gifData["images"]["fixed_height"]["url"]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
