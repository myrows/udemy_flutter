import 'package:flutter/material.dart';

import 'package:f2_components/src/pages/routes/routes.dart';





void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //  home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}