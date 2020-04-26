
import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2( context )
        ],
      )
    );
  }

  Widget _pagina1() {

    return Stack(
      children: <Widget>[
        _fondo(),
        _textos()
      ],
    );
  }

  Widget _pagina2( BuildContext context ) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(71, 185, 217, 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton( 
            onPressed: () {
              Navigator.of(context).pushNamed('botones');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Text('Bienvenidos',
              style: TextStyle( fontSize: 20.0 )),
            ),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 3.0,
            shape: StadiumBorder(),
          ),

        ],
      ),
    );
  }

  Widget _fondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {

    final estiloTexto = TextStyle( color: Colors.white, fontSize: 50.0);

    return SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.0),
          Text('11º', style: estiloTexto),
          Text('Miércoles', style: estiloTexto),
          Expanded(child: Container()),
          Icon( Icons.keyboard_arrow_down, size: 70.0, color: Colors.white )
        ],
      ),
    );
  }
}