import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final TextStyle txtStyle = new TextStyle( fontSize: 20 );
  int counter = 10;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks :', style: txtStyle),
            Text( '$counter' , style: txtStyle)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {
          counter += 1;
        },
      ),
    );
  }


}