
import 'dart:math';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar( context ),
    );
  }

  Widget _fondoApp() {

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
          Color.fromRGBO(52, 54, 101, 1.0),
          Color.fromRGBO(35, 37, 57, 1.0)
          ])
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0)
          ]
        )
        ),
      
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -80,
          child: cajaRosa
        )
      ],
    );
  }

  Widget _titulos() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Movie', style: TextStyle(fontSize: 30.0, color: Colors.white)),
            SizedBox(height: 10.0),
            Text('Busca aquellas películas por el criterio que más se ajuste a tus necesidades', style: TextStyle(fontSize: 15.0, color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(context) {

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith( caption: TextStyle( color: Colors.grey ) )

      ), 
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie, size: 30.0),
            title: Container()
          )
        ],
      )
    );
  }

  Widget _botonesRedondeados() {

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.indigo, Icons.calendar_today, 'Favoritas' ),
            _crearBotonRedondeado( Colors.pink, Icons.movie_creation, 'Novedades' )
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.purple, Icons.movie, 'Recientes' ),
            _crearBotonRedondeado( Colors.pinkAccent, Icons.movie, 'Populares' )
          ]
        )
      ],
    );
  }

  Widget _crearBotonRedondeado( Color color, IconData icon, String text ) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      height: 140.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            child: Icon(icon, color: Colors.white, size: 30.0),
            radius: 30.0,
            backgroundColor: color,
          ),
          SizedBox(height: 10.0),
          Text(text, style: TextStyle(color: Colors.pinkAccent))
        ],
      ),
    );
  }
}