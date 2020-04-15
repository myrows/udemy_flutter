
import 'package:f3_peliculas/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function nextPage;
  Pelicula myPelicula = new Pelicula();

  final _swiperController = new SwiperController();

  SwiperHorizontal({ @required this.peliculas, @required this.nextPage });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _swiperController.addListener( () {
      nextPage();
    });

    return Container(
      height: _screenSize.height * 0.2,
      width: _screenSize.height,
      child: swiperHorizontal( context ),
    );
  }

  Widget swiperHorizontal( BuildContext context ) {

    final _screenSize = MediaQuery.of(context).size;

    final swiper = Swiper(
          loop: false,
          itemBuilder: (BuildContext context, int index) {

            peliculas[index].uniqueId = '${ peliculas[index].id}-cardH';

            if(index == 0) {
              myPelicula = peliculas[index];
            }else {
              myPelicula = peliculas[index - 1];
            }
            
            if(index == peliculas.length - 2 ) {
              nextPage();
            }
           return Hero(
             tag: peliculas[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(peliculas[index].getPosterImg()),
                fit: BoxFit.cover,
                height: 160.0,
                ),
              ),
            );
          },
          itemCount: peliculas.length,
          viewportFraction: 0.35,
          scale: 0.5,
        );

    return GestureDetector(
      child: swiper,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: myPelicula);
      },
    );
  }

}