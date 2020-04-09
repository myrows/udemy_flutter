
import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          customCard(),
          SizedBox(height: 30.0,),
          cardImage(),
          SizedBox(height: 30.0,),
          cardImage(),
          SizedBox(height: 30.0,),
          cardImage()

        ],
      ),
    );
  }

  Widget customCard() {

    return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(20),
                  leading: Icon(Icons.image, color: Colors.blue,),
                  title: Text('Buenos días como te ha ido la mañana'),
                  subtitle: Text('Creo que me ha ido bastante bien, estoy aprendiendo flutter satisfactoriamente con el instructor Fernando Herrera'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Cancelar'
                      ),
                      onPressed: () {},
                    ),

                    FlatButton(
                      child: Text(
                        'Ok'
                      ),
                      onPressed: () {},
                    )
                  ],
                )

              ],
            ),
          );
  }

  Widget cardImage() {
    
    final card = Container(
      child: Column(
        children: <Widget>[

          FadeInImage(
            height: 300.0,
            fit: BoxFit.cover,
            fadeInDuration: Duration( milliseconds: 200 ),
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg')
          ),
          /*Image(
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Una bonita imagen')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 10.0)
        )
      ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}