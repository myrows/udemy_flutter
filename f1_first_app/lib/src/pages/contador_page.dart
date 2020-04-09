import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget {

  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State {

  final TextStyle _txtStyle = new TextStyle( fontSize: 20 );
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('First App Flutter'),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de taps :', style: _txtStyle),
            Text( '$_counter' , style: _txtStyle)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.end,

      children: <Widget>[

      SizedBox(width: 30.0,),

      FloatingActionButton(
        child: Icon( Icons.exposure_zero ),
        onPressed: () {

          setState(() => _counter = 0 );

        },
      ),

      Expanded(child: SizedBox()),

      FloatingActionButton(
        child: Icon( Icons.remove ),
        onPressed: () {

          setState(() { 
            if(_counter > 0){
              _counter--;
            }
           });

        },
      ),

      SizedBox( width: 5.0),

      FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          setState(() => _counter++ );

        },
      )

      ],

    );
  }

}