import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget modalBottom = SizedBox.expand(
    child: DraggableScrollableSheet(
        initialChildSize: 0.12,
        minChildSize: 0.04,
        maxChildSize: 0.8,
        builder: (BuildContext context, s) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  )
                ]),
            child: ListView(
              controller: s,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 8,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Monstera deliciosa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Family',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Araceae',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Genus',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Monstera',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Monstera deliciosa adalah spesies tanaman berbunga yang berasal dari hutan tropis di Meksiko selatan, di selatan Panama. [2] Ini telah diperkenalkan ke banyak daerah tropis, dan telah menjadi spesies invasif ringan di Hawaii, Seychelles, Pulau Ascension dan Kepulauan Society.',
                  style: TextStyle(fontSize: 18, letterSpacing: 0.8),
                ),
              ],
            ),
          );
        }));
