import 'package:f3_peliculas/src/pages/movie_detail.dart';
import 'package:flutter/material.dart';

 import 'package:f3_peliculas/src/pages/home_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/',
      routes: {
        '/'           : ( BuildContext context ) => HomePage(),
        'detalle'     : ( BuildContext context ) => MovieDetail(),
      },
    );
  }
}