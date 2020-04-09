import 'package:flutter/material.dart';

import 'package:f2_components/src/pages/alert_page.dart';
import 'package:f2_components/src/pages/providers/menu_provider.dart';
import 'package:f2_components/src/pages/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
      return ListView(
      children: _listaItems( snapshot.data, context ),
      );
      },
    );


  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];

    data.forEach( (opt) {
      final icon = opt['icon'];
      final ruta = opt['ruta'];
      final widgetTemp = ListTile( 
        title: Text(opt['texto']),
        leading: getIcon(icon),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {

          Navigator.pushNamed(context, ruta);

          /*final route = MaterialPageRoute(
            builder:  ( context )=> AlertPage()
          );

          Navigator.push(context, route);*/
          
        },
      );
      opciones..add( widgetTemp )..add( Divider() );
    });

    return opciones;
  }
}