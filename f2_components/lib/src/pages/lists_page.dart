
import 'dart:async';

import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _countImages = 0;
  bool _isLoading = false;

  @override
  void initState() { 
    super.initState();
    fetchData();

    _scrollController.addListener( () {
    
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {

        _agregar10();
      }
    });
  }

  //Prevenimos fugas de memoria
  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Lists - Scroll'),
       ),
       body: Stack(
         children: <Widget>[
           _crearLista(),
           _crearLoading()
         ],),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(

        onRefresh: obtenerPagina1,
        
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int position) {

          final image = _listaNumeros[position];

          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$image/500/300.jpg')
          );
        }
      ),
    );
  }

  void _agregar10() {

    for (var i = 0; i < 10; i++) {
      _countImages++;
      _listaNumeros.add(_countImages);
    }

    setState(() {});
  }

  Future fetchData() async {

    _isLoading = true;

    setState(() {});

    final duration = new Duration( seconds: 2 );

    return Timer(
        duration,
        respuestaHTTP
    );

  }

  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );

    _agregar10();

  }

  Widget _crearLoading() {

    if( _isLoading ) {

      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 30.0)
        ],
      );
    }else {

      return Container();
    }

  }

  Future<Null>obtenerPagina1() async {

    final duration = new Duration(seconds: 2);
    new Timer( duration, () {
      _listaNumeros.clear();
      _agregar10();
    });

    return Future.delayed(duration);

  }

}