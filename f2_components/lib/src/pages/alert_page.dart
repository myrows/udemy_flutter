import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            _showAlert( context );
          },
        ),
      ),
    );
  }

  void _showAlert( BuildContext context ) {

    showDialog( 
      context: context ,
      //Eliminar la alerta si pinchamos fuera
      barrierDismissible: false,
      builder: ( context ) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Esto es el contenido de mi alerta, eso es un ejemplo de las alertas de flutter en dart'),
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
          actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop()
              ),

              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop()
              )
          ],
        );
      }


    );
  }
}