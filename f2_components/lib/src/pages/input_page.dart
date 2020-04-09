import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _fullname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[

          _crearInput(),

          SizedBox(height: 20),

          _crearEmail(),

          SizedBox(height: 20),

          _crearPassword(),

          SizedBox(height: 20),

          _crearFecha()

        ],
      ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon( Icons.person ),
        suffixIcon: Icon( Icons.accessibility ),
        counter: Text('${_fullname.length}', style: TextStyle(color: Colors.blue),),
        hintText: 'Matthew Griego',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Name - Surname'
      ),
      onChanged: ( text ) {
        setState(() {
          _fullname = text;
        });
      },
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon( Icons.email ),
        suffixIcon: Icon( Icons.alternate_email ),
        hintText: 'ejemplo@gmail.com',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Email'
      ),
      onChanged: ( text ) {
        setState(() {
          _fullname = text;
        });
      },
    );
  }

  Widget _crearPassword() {


    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon( Icons.lock ),
        suffixIcon: Icon( Icons.security ),
        hintText: '********',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Password'
      ),
      onChanged: ( text ) {
        setState(() {
          _fullname = text;
        });
      },
    );
  }

  Widget _crearFecha() {

    return TextField(
      enableInteractiveSelection: false,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: Icon( Icons.calendar_today ),
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        hintText: 'Fecha de nacimiento',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Fecha de nacimiento'
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());

      },
      onChanged: ( text ) {
        setState(() {
          _fullname = text;
        });
      },
    );

  }
}