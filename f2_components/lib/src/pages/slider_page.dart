
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 0;
  bool _bloqCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider'),
       ),
       body: Container(
         padding: EdgeInsets.symmetric(vertical: 50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),

             _checkBox(),
             _crearSwitch(),
             Expanded(child: _crearImagen())
           ],
         ),

       ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      divisions: 20,
      activeColor: Colors.indigoAccent,
      label: '$_sliderValue',
      value: _sliderValue,
      min: 0,
      max: 400,
      onChanged: ( _bloqCheck ) ? null : ( valor ) {
        setState(() => _sliderValue = valor );
      },

    );
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2017/03/landscape-photography-tom-archer-2.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
      );
  }

  Widget _checkBox() {

        return CheckboxListTile(
          title: Text('Bloquear Slider'),
          activeColor: Colors.indigoAccent,
          value: _bloqCheck,
          onChanged: ( checked ) {
            setState(() => _bloqCheck = checked);
      }
    );
  }

  Widget _crearSwitch() {


        return SwitchListTile(
          title: Text('Bloquear Slider'),
          activeColor: Colors.indigoAccent,
          value: _bloqCheck,
          onChanged: ( checked ) {
            setState(() => _bloqCheck = checked);
      }
    );
  }
}