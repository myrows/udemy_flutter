
import 'package:f3_peliculas/src/models/pelicula_model.dart';
import 'package:f3_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String seleccion;
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Ironman'
  ];

  final peliculasRecientes = [
    'Bad Boys',
    'BloodShot',
    'Harry Potter'
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono prefix de nuestro AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Los resultados que mostraremos
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe

    if(  query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: ( BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot ) {

        if( snapshot.hasData ) {

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map( (pelicula) {

              return ListTile(
                leading: FadeInImage(placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage( pelicula.getPosterImg() ),
                width: 50.0,
                fit: BoxFit.contain,
                ),
                title: Text( pelicula.title ),
                subtitle: Text( pelicula.originalTitle ),
                onTap: () {
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    /*final listaSugerida = ( query.isEmpty ) 
      ? peliculasRecientes
      : peliculas.where( (p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();


    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon ( Icons.movie ),
          title: Text(listaSugerida[i]),
          onTap: () {
            seleccion = listaSugerida[i];
            //Construir los resultados
            showResults( context );
          },
        );
      },
    );
  }*/


}

}