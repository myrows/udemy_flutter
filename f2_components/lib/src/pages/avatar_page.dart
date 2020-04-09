import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/13936061?s=460&u=c867617185193d6f27e647d9680033d59a9b9753&v=4')
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('DT'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(        
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'),
          image: NetworkImage('https://avatars1.githubusercontent.com/u/13936061?s=460&u=c867617185193d6f27e647d9680033d59a9b9753&v=4'),
          fadeInDuration: Duration(milliseconds: 200),
          ),
      ),
    );
  }
}