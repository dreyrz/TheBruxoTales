import 'package:flutter/material.dart';
import './screens/criarPage.dart';
import './screens/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(title: 'Main', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();

    @override
    void initState() {
    super.initState();
    // Start listening to changes.
    textController.addListener(printLatestValue);
    }

    dynamic printLatestValue() {
      print("Second text field: ${textController.text}");
    }
    Widget build(BuildContext context) {
    return (
      Container(
      color: Colors.grey,
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:20.0),
          child: logo(),
        ),
        Padding(
          padding: EdgeInsets.only(top:60.0),
          child: buttonCriar(context,'Criar')
        ),
        Padding(
          padding: EdgeInsets.only(bottom:140.0),
          child: buttonCriar(context,'Login')
        ),
      ], 
    ),
    )
    );
  }

  Widget buttonCriar(BuildContext context, texto) {
    return new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0, //clarea
              spreadRadius: 0.0, //expande
              offset: Offset(
                0.0, //horizontal
                6.0, //vertical
              ),
            )
          ],
          borderRadius: new BorderRadius.circular(50.0),
        ),
        child: SizedBox(
            width: 180,
            child: RaisedButton(
                child: Text('$texto',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontStyle: FontStyle.normal,
                    )),
                onPressed: () {
                  if (texto == "Login") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CriarPage()));
                },
                color: Color.fromARGB(255, 110, 159, 106),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))));
  }

  Widget logo() {
    return new Container(
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: AspectRatio(
            aspectRatio: 2.5 / 1,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: Image(
                  image: AssetImage('assets/witcher.jpg'),
                  fit: BoxFit.fill,
                )),
          )),
    );
  }

  Widget input(String nome, var controlador) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controlador,
      autofocus: false,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.done,
      obscureText: false, //texto em formato de senha
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(2),
        labelText: "",
        labelStyle: TextStyle(
          color: Colors.pink,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 5)),
        hintText: '',
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
