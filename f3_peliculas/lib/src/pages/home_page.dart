import 'package:f3_peliculas/src/providers/peliculas_provider.dart';
import 'package:f3_peliculas/src/search/search_delegate.dart';
import 'package:f3_peliculas/src/widgets/card_horizontal_swiper_widget.dart';
import 'package:f3_peliculas/src/widgets/card_swiper_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
          icon: Icon( Icons.search ),
          onPressed: () {
            showSearch(context: context,
             delegate: DataSearch(),
             query: ''
            );
          }
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        if( snapshot.hasData ) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            ));
        }
      },
    );
  }

  Widget _footer( BuildContext context ) {

    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Populares', style: Theme.of(context).textTheme.subhead),

          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: ( BuildContext context, AsyncSnapshot snapshot ) {

              if(snapshot.hasData) {

                return SwiperHorizontal(peliculas: snapshot.data, nextPage: peliculasProvider.getPopulares);
              } else {

                return Container(
                  child: Center(
                    child: CircularProgressIndicator()),
                );
              }
              
            },
          )
        ],
      ),
    );
  }
}