
import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final estiloTitulo = TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle( fontSize: 12.0, color: Colors.grey );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto()
        ],
        ),
      )
    );
  }

  Widget _crearImagen() {
      return Image(
            image: NetworkImage('https://icons8.com/wp-content/uploads/2020/02/digital-illustration-brian-edward-miller.jpg'),
            );
  }

  Widget _crearTitulo() {

      return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('La meta de dos hombres en el atardecer', style: estiloTitulo),
                      SizedBox(height: 7.0),
                      Text('Un clima cálido con un atardecer', style: estiloSubtitulo)
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.red, size: 20.0),
                Text('41', style: TextStyle(fontSize: 15.0))
              ],
            ),
          );
  }

  Widget _crearAcciones() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _accion( Icons.call, 'Llamar' ),
          _accion( Icons.near_me, 'ROUTE'),
          _accion( Icons.share, 'SHARE' )
        ],
      ),
    );
  }

  Widget _accion( IconData icon, String text ) {

    return Column(
            children: <Widget>[
              Icon( icon, color: Colors.blue ),
              SizedBox(height: 5.0),
              Text(text, style: TextStyle( color: Colors.blue )),
            ],
          );
  }

  Widget _crearTexto() {

    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Nostrud commodo enim consectetur occaecat. Do commodo non qui nisi eu adipisicing minim excepteur amet eiusmod irure sunt elit pariatur. Do sit magna ea consequat. Ex aute voluptate adipisicing magna magna ex laborum ipsum Lorem adipisicing exercitation id aute sit. Sunt do ullamco nulla esse aliquip occaecat. Commodo esse ullamco anim do qui dolore id est nisi ut id.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

}