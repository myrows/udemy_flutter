
import 'package:f4_disenos/src/pages/basic_page.dart';
import 'package:f4_disenos/src/pages/botones_page.dart';
import 'package:f4_disenos/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'scroll',
      routes: {
        'basico'  : ( BuildContext context ) => BasicPage(),
        'scroll'  : ( BuildContext context ) => ScrollPage(),
        'botones' : ( BuildContext context ) => BotonesPage(),
      },
    );
  }
}