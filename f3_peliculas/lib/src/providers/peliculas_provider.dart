import 'dart:async';
import 'dart:convert';

import 'package:f3_peliculas/src/models/actores_mode.dart';
import 'package:http/http.dart' as http;
import 'package:f3_peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {


  String _apikey      = '753b101a563a6bc2b28b1783db8e10da';
  String _url         = 'api.themoviedb.org';
  String _language    = 'es-Es';
  int _popularesPage  = 0;
  bool _cargando      = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }


   Future<List<Pelicula>> getEnCines() async {

     final url = Uri.https(_url, '3/movie/now_playing', {
       // Definimos los parámetros adicionales de la petición HTTP
       'api_key'  : _apikey,
       'language' : _language
     });

     final response = await http.get(url);

     //Decodificamos la respuesta http y obtenemos el data
     final decodedData = json.decode(response.body);

     final peliculas = new Peliculas.fromJsonList(decodedData['results']);

     return peliculas.items;

  }

   Future<List<Pelicula>> getPopulares() async {

       if( _cargando ) return [];

       _cargando = true;

       //Incrementamos la página de películas
       _popularesPage++;

     final url = Uri.https(_url, '3/movie/popular', {
       // Definimos los parámetros adicionales de la petición HTTP
       'api_key'  : _apikey,
       'language' : _language,
       'page'     : _popularesPage.toString()
     });

     final response = await http.get(url);

     //Decodificamos la respuesta http y obtenemos el data
     final decodedData = json.decode(response.body);

     final peliculas = new Peliculas.fromJsonList(decodedData['results']);

     _populares.addAll(peliculas.items);
     popularesSink( _populares );

     _cargando = false;
     return peliculas.items;



  }

   Future<List<Actor>> getCast( String peliId ) async {

     final url = Uri.https(_url, '3/movie/$peliId/credits', {
       'api_key'  : _apikey,
       'language' : _language
     });

     final resp = await http.get(url);
     final decodedData = json.decode(resp.body);
     final cast = new Cast.fromJsonList(decodedData['cast']);

     return cast.actores;
   }

   Future<List<Pelicula>> buscarPelicula( String query ) async {

     final url = Uri.https(_url, '3/search/movie', {
       // Definimos los parámetros adicionales de la petición HTTP
       'api_key'  : _apikey,
       'language' : _language,
       'query'    : query
     });

     final response = await http.get(url);

     //Decodificamos la respuesta http y obtenemos el data
     final decodedData = json.decode(response.body);

     final peliculas = new Peliculas.fromJsonList(decodedData['results']);

     return peliculas.items;

  }
}