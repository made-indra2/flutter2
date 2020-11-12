import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.orangeAccent,
          appBar: AppBar(
            leading: Icon(Icons.web, color: Colors.black,),
            title: Text('Mari Makan-makan Bersama-sama'),
            backgroundColor: Colors.pinkAccent,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.thumb_up,color: Colors.black,)),
              IconButton(icon: Icon(Icons.thumb_down,color: Colors.black,)),
            ],


          ),
          body: Center(
            child: Image(
              image: NetworkImage('https://osmd.files.wordpress.com/2013/01/2012-12-30-12-03-32.jpg')
                ),
            ),
        ),
      )
  );
}