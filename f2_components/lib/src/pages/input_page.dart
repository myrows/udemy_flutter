import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _fullname = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();

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

          _crearFecha( context ),

          SizedBox(height: 20),

          _crearDropdown( context )

        ],
      ),
    );
  }

  Widget _crearInput() {
    
    return TextField(
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

  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        prefixIcon: Icon( Icons.calendar_today ),
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        hintText: '1998-04-10',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Date of birth'
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());

        //Datepicker
        _selectDate( context );

      },
      onChanged: ( text ) {
        setState(() {
          _fullname = text;
        });
      },
    );

  }

      _selectDate(BuildContext context) async {

      DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'Spanish')
      );

      if ( picked != null ) {

        setState(() {
          _fecha = picked.toString();

          //Establecemos la comunicación con el input de la fecha
          _inputFieldDateController.text = _fecha;
        });

      }

    }

    List<DropdownMenuItem<String>> getOpcionesDropdown() {

      List<DropdownMenuItem<String>> lista = new List();

      _poderes.forEach( (poder) {

        lista.add( DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));

      });

      return lista;
    }

  Widget _crearDropdown(BuildContext context) {

    return Row(
      children: <Widget>[
        SizedBox(width: 10.0),
        Expanded(
            child: DropdownButton(
              icon: Icon( Icons.power ),
            elevation: 3,
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: ( data ) {

              setState(() => _opcionSeleccionada = data
              );
              
            }
          ),
        ),
      ],
    );
  }

}